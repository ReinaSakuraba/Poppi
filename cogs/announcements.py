import re
import io
import datetime

import discord


class Announcements:
    def __init__(self, bot):
        self.bot = bot
        self.pool = bot.pool

    async def on_member_join(self, member):
        await self.member_action(member, 'joined')

    async def on_member_remove(self, member):
        await self.member_action(member, 'left')

    async def member_action(self, member, event):
        guild = member.guild
        is_join = event == 'joined'
        message_row = 'greeting' if is_join else 'farewell'

        for table in ('announcements', 'logs'):
            query = f'SELECT * FROM {table} WHERE guild_id=$1;'
            record = await self.pool.fetchrow(query, guild.id)

            if record is None:
                continue

            channel = guild.get_channel(record['channel_id'])
            if channel is None:
                continue

            if table == 'log':
                await self.send_log_message(member, channel, event)
            else:
                message = record[message_row]
                await self.send_notice(member, channel, message, is_join)

    async def send_notice(self, member, channel, message, is_join):
        repl = {
            'name': member.name,
            'server': channel.guild.name,
        }

        if is_join:
            repl['mention'] = member.mention

        def repl_with_var(match):
            return repl.get(match.group(1), match.group(1))

        message = re.sub(r'{(.+?)}', repl_with_var, message)

        try:
            await channel.send(message)
        except:
            pass

    async def send_log_message(self, member, channel, event):
        embed = discord.Embed(title=f'Member {event}.')
        embed.description = f'Name: {member}\nID: {member.id}'
        embed.set_thumbnail(url='attachment://avatar.png')
        embed.set_footer(text=f'{event.title()} on')
        embed.timestamp = datetime.datetime.utcnow()

        avatar_url = member.avatar_url_as(format='png')
        async with self.bot.session.get(avatar_url) as r:
            file = discord.File(io.BytesIO(await r.read()), 'avatar.png')

        try:
            await channel.send(embed=embed, file=file)
        except:
            pass


def setup(bot):
    bot.add_cog(Announcements(bot))
