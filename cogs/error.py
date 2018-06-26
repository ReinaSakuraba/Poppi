import traceback

import discord
from discord.ext import commands

import utils


class ErrorHandler:
    handler = {
        commands.DisabledCommand: 'The "{command_name}" command has been disabled.',
        commands.NoPrivateMessage: 'The "{command_name}" command may not be used in Direct Messages.',
        utils.MissingPerms: '```\n{exception}\n```'
    }
    ignored = (commands.CommandNotFound, commands.UserInputError, commands.CheckFailure)

    async def on_command_error(self, ctx, exception):
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


def setup(bot):
    bot.add_cog(ErrorHandler())
