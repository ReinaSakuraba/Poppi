import discord
from discord.ext import commands

import utils


class Stars:
    @commands.command()
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


def setup(bot):
    bot.add_cog(Stars())
