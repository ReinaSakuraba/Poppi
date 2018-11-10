import io
import datetime
import traceback

import discord
from discord.ext import commands

from bot import Bot
import utils


class Log:
    handler = {
        commands.DisabledCommand: 'The "{command_name}" command has been disabled.',
        commands.NoPrivateMessage: 'The "{command_name}" command may not be used in Direct Messages.',
        utils.MissingPerms: '```\n{exception}\n```'
    }
    ignored = (commands.CommandNotFound, commands.UserInputError, commands.CheckFailure)

    def __init__(self, bot):
        self.bot = bot

    async def on_command_error(self, ctx: utils.Context, exception: commands.CommandError):
        exception = getattr(exception, 'original', exception)

        message = self.handler.get(type(exception))
        if message:
            return await ctx.send(message.format(exception=exception, command_name=ctx.command.qualified_name))

        if isinstance(exception, self.ignored):
            return

        embed = discord.Embed(title=f'Command Exception', color=discord.Color.red())
        embed.set_footer(text='Occured on')
        embed.timestamp = ctx.message.created_at

        exc = ''.join(traceback.format_exception(type(exception), exception, exception.__traceback__, chain=False))
        exc = exc.replace('`', '\u200b')
        embed.description = f'```py\n{exc}\n```'

        embed.add_field(name='Command', value=ctx.command.qualified_name)
        embed.add_field(name='Invoker', value=ctx.author)
        embed.add_field(name='Location', value=f'Guild: {ctx.guild}\nChannel: {ctx.channel}')
        embed.add_field(name='Message', value=ctx.message.clean_content)

        await ctx.bot.feedback_channel.send(embed=embed)

    async def on_guild_join(self, guild: discord.Guild):
        await self.guild_action(guild, 'joined')

    async def on_guild_remove(self, guild: discord.Guild):
        await self.guild_action(guild, 'left')

    async def guild_action(self, guild: discord.Guild, event: str):
        color = discord.Color.green() if event == 'joined' else discord.Color.red()
        bots = sum(m.bot for m in guild.members)

        embed = discord.Embed(title=f'{event.title()} Server', color=color, timestamp=datetime.datetime.now())
        embed.add_field(name='Server', value=f'{guild.name} - {guild.id}', inline=False)
        embed.add_field(name='Owner', value=f'{guild.owner} - {guild.owner.id}', inline=False)
        embed.add_field(name='Members', value=guild.member_count)
        embed.add_field(name='Bots', value=f'{bots} - {bots/guild.member_count:.2%}')
        embed.add_field(name='Channels', value=len(guild.channels))
        embed.add_field(name='Roles', value=len(guild.roles))
        embed.set_footer(text=event.title())

        parameters = {'embed': embed}

        if guild.icon:
            async with self.bot.session.get(guild.icon_url_as(format='png')) as r:
                file = discord.File(io.BytesIO(await r.read()), 'icon.png')

            embed.set_thumbnail(url='attachment://icon.png')
            parameters['file'] = file

        await self.bot.feedback_channel.send(**parameters)


def setup(bot: Bot):
    bot.add_cog(Log(bot))
