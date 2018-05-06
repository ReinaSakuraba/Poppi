import asyncio

import asyncpg
import discord
from discord.ext import commands

import utils


class Stars:
    def __init__(self, bot):
        self.bot = bot
        self.lock = asyncio.Lock(loop=bot.loop)

    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions()
    async def starboard(self, ctx, *, name='starboard'):
        query = "SELECT * FROM starboards WHERE guild_id=$1;"
        record = await ctx.pool.fetchrow(query, ctx.guild.id)

        if record:
            channel = ctx.guild.get_channel(record['channel_id'])
            if channel:
                return await ctx.send(f'This server already has a starboard {channel.mention}.')
            else:
                query = "DELETE FROM starboards WHERE guild_id=$1;"
                await ctx.pool.execute(query, ctx.guild.id)

        perms = ctx.me.guild_permissions

        if not perms.manage_roles or not perms.manage_channels:
            return await ctx.send('I do not have the proper permissions (Manage Roles and Manage Channel)')

        overwrites = {
            ctx.me: discord.PermissionOverwrite(
                read_messages=True,
                send_messages=True,
                manage_messages=True,
                embed_links=True,
                read_message_history=True
            ),
            ctx.guild.default_role: discord.PermissionOverwrite(
                read_messages=True,
                send_messages=False,
                read_message_history=True
            )
        }

        try:
            channel = await ctx.guild.create_text_channel(name=name, overwrites=overwrites)
        except discord.HTTPException:
            return await ctx.send('This channel name is bad or an unknown error happened.')

        query = "INSERT INTO starboards (guild_id, channel_id) VALUES ($1, $2);"
        await ctx.pool.execute(query, ctx.guild.id, channel.id)

        await ctx.send(f'Starboard created at {channel.mention}')

    @starboard.command(name='limit')
    @utils.mod_or_permissions()
    async def starboard_limit(self, ctx, stars: int):
        stars = min(max(stars, 1), 25)

        query = """
                UPDATE starboards
                SET threshold=$2
                WHERE guild_id=$1
                RETURNING 1;
                """
        result = await ctx.pool.fetchval(query, ctx.guild.id, stars)

        if result is None:
            return await ctx.send('This server does not have a starboard.')

        await ctx.send(f'Messages now require {utils.plural("star", stars)} to show up in the starboard.')

    async def on_raw_reaction_add(self, payload):
        await self.reaction_action('star', payload)

    async def reaction_action(self, event, payload):
        if str(payload.emoji) != '\N{WHITE MEDIUM STAR}':
            return

        channel = self.bot.get_channel(payload.channel_id)
        if not isinstance(channel, discord.TextChannel):
            return

        method = getattr(self, f'{event}_message')

        user = channel.guild.get_member(payload.user_id)
        if user is None or user.bot:
            return

        await method(channel, payload.message_id, payload.user_id)

    async def star_message(self, channel, message_id, user_id):
        async with self.lock:
            query = "SELECT * FROM starboards WHERE guild_id=$1;"
            starboard = await self.bot.pool.fetchrow(query, channel.guild.id)

            if starboard is None:
                return

            star_channel = channel.guild.get_channel(starboard['channel_id'])

            if star_channel is None:
                return

            if channel.id == star_channel.id:
                return # Star the original message here

            message = await channel.get_message(message_id)

            if message is None:
                return

            if (len(message.content) == 0 and len(message.attachments) == 0) or message.type is not discord.MessageType.default:
                return

            query = """
                    INSERT INTO starboard_entries (
                        message_id,
                        channel_id,
                        guild_id,
                        author_id
                    ) VALUES ($1, $2, $3, $4)
                    ON CONFLICT(message_id)
                    DO NOTHING
                    """

            await self.bot.pool.execute(query, message.id, channel.id, channel.guild.id, message.author.id)

            query = """
                    INSERT INTO starrers (
                        author_id,
                        message_id
                    ) VALUES($1, $2);
                    """

            try:
                await self.bot.pool.execute(query, user_id, message.id)
            except asyncpg.UniqueViolationError:
                return

            query = "SELECT COUNT(*) FROM starrers WHERE message_id=$1;"
            stars = await self.bot.pool.fetchval(query, message.id)

            if stars < starboard['threshold']:
                return

            content, embed = self.create_post(message, stars)

            query = "SELECT bot_message_id FROM starboard_entries WHERE message_id=$1;"
            bot_message_id = await self.bot.pool.fetchval(query, message.id)

            if bot_message_id is None:
                new_msg = await star_channel.send(content, embed=embed)
                query = "UPDATE starboard_entries SET bot_message_id=$1 WHERE message_id=$2;"
                await self.bot.pool.execute(query, new_msg.id, message.id)
            else:
                new_msg = await star_channel.get_message(bot_message_id)
                await new_msg.edit(content, embed=embed)

    def star_emoji(self, stars):
        if 5 >= stars >= 0:
            return '\N{WHITE MEDIUM STAR}'
        elif 10 >= stars >= 6:
            return '\N{GLOWING STAR}'
        elif 25 >= stars >= 11:
            return '\N{DIZZY SYMBOL}'
        else:
            return '\N{SPARKLES}'

    def star_gradient_colour(self, stars):
        p = stars / 13
        if p > 1.0:
            p = 1.0

        red = 255
        green = int((194 * p) + (253 * (1 - p)))
        blue = int((12 * p) + (247 * (1 - p)))
        return (red << 16) + (green << 8) + blue

    def create_post(self, message, stars):
        emoji = self.star_emoji(stars)

        if stars > 1:
            content = f'{emoji} **{stars}** {message.channel.mention}'
        else:
            content = f'{emoji} {message.channel.mention}'

        embed = discord.Embed()
        embed.description = message.content
        embed.timestamp = message.created_at
        embed.color = self.star_gradient_colour(stars)

        embed.set_author(name=message.author, icon_url=message.author.avatar_url_as(format='png'))

        image = None
        attachments = []

        if message.embeds:
            data = message.embeds[0]
            if data.type == 'image':
                image = data.url

        for attachment in message.attachments:
            if image is None and attachment.url.lower().endswith(('png', 'jpeg', 'jpg', 'gif', 'webp')):
                image = attachment.url
            else:
                attachments.append(f'[{attachment.filename}]({attachment.url})')

        if image:
            embed.set_image(url=image)

        if attachments:
            embed.add_field(name='Attachments', value='\n'.join(attachments))

        return content, embed


def setup(bot):
    bot.add_cog(Stars(bot))
