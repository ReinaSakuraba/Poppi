from discord.ext import commands

from . import CaseInsensitiveDict


class Group(commands.Group):
    def __init__(self, case_insensitive=True, **kwargs):
        super().__init__(**kwargs)
        if case_insensitive:
            self.all_commands = CaseInsensitiveDict()


def group(**attrs):
    return commands.command(cls=Group, **attrs)


class CommandConverter(commands.Converter):
    async def convert(self, ctx, argument):
        obj = ctx.bot.get_cog(argument) or ctx.bot.get_command(argument)
        if obj is None:
            raise commands.BadArgument(f'No command called "{argument}" found.')

        return obj
