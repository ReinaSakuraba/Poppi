from discord.ext import commands

from . import CaseInsensitiveDict


class Group(commands.Group):
    def __init__(self, case_insensitive=True, **kwargs):
        super().__init__(**kwargs)
        if case_insensitive:
            self.all_commands = CaseInsensitiveDict()


def group(**attrs):
    return commands.command(cls=Group, **attrs)
