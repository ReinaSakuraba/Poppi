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


class Query(commands.Converter):
    def __init__(self, *, multi=True, **kwargs):
        self.multi = multi
        self.params = {'part': 'id'}
        self.params.update(kwargs)

    def parse_argument(self, argument):
        if not self.multi:
            return argument, 1

        view = commands.view.StringView(argument)
        limit = commands.view.quoted_word(view)
        view.skip_ws()
        query = view.read_rest()
        try:
            limit = int(limit)
        except ValueError:
            query = f'{limit} {query}'
            limit = 1

        if not query:
            query = str(limit)
            limit = 1

        if limit <= 0:
            raise commands.BadArgument('Search limit must be greater than 0.')

        return query, limit

    async def convert(self, ctx, argument):
        query, limit = self.parse_argument(argument)

        params = {
            'q': query,
            'maxResults': limit,
        }
        params.update(self.params)
        return params
