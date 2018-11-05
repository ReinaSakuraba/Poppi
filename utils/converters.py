import re
import datetime

import parsedatetime as pdt
from dateutil.relativedelta import relativedelta
import discord
from discord.ext import commands

from . import CaseInsensitiveDict


__all__ = ('Group', 'group', 'EmojiConverter', 'Emoji', 'CommandConverter', 'Query', 'TagName', 'Time')


class Group(commands.Group):
    def __init__(self, case_insensitive=True, **kwargs):
        super().__init__(**kwargs)
        if case_insensitive:
            self.all_commands = CaseInsensitiveDict()

    def group(self, *args, **kwargs):
        def decorator(func):
            result = group(*args, **kwargs)(func)
            self.add_command(result)
            return result

        return decorator


def group(**attrs):
    return commands.command(cls=Group, **attrs)


class EmojiConverter(commands.Converter):
    compiled = re.compile(r'<a?:(.+?):([0-9]{15,21})>')
    async def convert(self, ctx, argument):
        match = self.compiled.match(argument)
        if not match:
            try:
                kwargs = {'id': int(argument)}
            except ValueError:
                kwargs = {'name': argument}
            emoji = discord.utils.get(ctx.guild.emojis, **kwargs)
            if emoji is None:
                raise commands.BadArgument('This is not a custom Emoji.')
            return emoji

        return Emoji(match.group(1), match.group(2), argument.startswith('<a:'))


class Emoji:
    def __init__(self, name, id, animated):
        self.name = name
        self.id = id
        self.animated = animated

    @property
    def url(self):
        _format = 'gif' if self.animated else 'png'
        return f'https://cdn.discordapp.com/emojis/{self.id}.{_format}'


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


class TagName(commands.clean_content):
    async def convert(self, ctx, argument):
        converted = await super().convert(ctx, argument)

        if not converted:
            raise commands.BadArgument('Missing tag name.')

        if len(converted) > 100:
            raise commands.BadArgument('Tag name cannot have over 100 characters.')

        return converted


class Time(commands.Converter):
    calendar = pdt.Calendar(version=pdt.VERSION_CONTEXT_STYLE)
    compiled = re.compile("""(?:(?P<years>[0-9])(?:years?|y))?             # e.g. 2y
                             (?:(?P<months>[0-9]{1,2})(?:months?|mo))?     # e.g. 2months
                             (?:(?P<weeks>[0-9]{1,4})(?:weeks?|w))?        # e.g. 10w
                             (?:(?P<days>[0-9]{1,5})(?:days?|d))?          # e.g. 14d
                             (?:(?P<hours>[0-9]{1,5})(?:hours?|h))?        # e.g. 12h
                             (?:(?P<minutes>[0-9]{1,5})(?:minutes?|m))?    # e.g. 10m
                             (?:(?P<seconds>[0-9]{1,5})(?:seconds?|s))?    # e.g. 15s
                          """, re.VERBOSE)

    async def check_constraints(self, ctx, now, remaining):
        if self.dt < now:
            raise commands.BadArgument('This time is in the past.')

        self.message = await commands.clean_content().convert(ctx, remaining or 'something')

        return self

    async def convert(self, ctx, argument):
        now = datetime.datetime.utcnow()

        match = self.compiled.match(argument)
        if match is not None and match.group(0):
            data = { k: int(v) for k, v in match.groupdict(default=0).items() }
            remaining = argument[match.end():].strip()
            self.dt = now + relativedelta(**data)
            return await self.check_constraints(ctx, now, remaining)

        if argument.endswith('from now'):
            argument = argument[:-8].strip()

        if argument[0:2] == 'me':
            if argument[0:6] in ('me to ', 'me in '):
                argument = argument[6:]

        elements = self.calendar.nlp(argument, sourceTime=now)
        if elements is None or len(elements) == 0:
            raise commands.BadArgument('Invalid time provided, try e.g. "tomorrow" or "3 days".')

        dt, status, begin, end, dt_string = elements[0]

        if not status.hasDateOrTime:
            raise commands.BadArgument('Invalid time provided, try e.g. "tomorrow" or "3 days".')

        if begin not in (0, 1) and end != len(argument):
            raise commands.BadArgument('Time is either in an inappropriate location, which ' \
                                       'must be either at the end or beginning of your input, ' \
                                       'or I just flat out did not understand what you meant. Sorry.')

        if not status.hasTime:
            dt = dt.replace(hour=now.hour, minute=now.minute, second=now.second, microsecond=now.microsecond)

        self.dt =  dt

        if begin in (0, 1):
            if begin == 1:
                if argument[0] != '"':
                    raise commands.BadArgument('Expected quote before time input...')

                if not (end < len(argument) and argument[end] == '"'):
                    raise commands.BadArgument('If the time is quoted, you must unquote it.')

                remaining = argument[end + 1:].lstrip(' ,.!')
            else:
                remaining = argument[end:].lstrip(' ,.!')
        elif len(argument) == end:
            remaining = argument[:begin].strip()

        return await self.check_constraints(ctx, now, remaining)
