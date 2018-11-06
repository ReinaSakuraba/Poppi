import re
import datetime

import parsedatetime as pdt
from dateutil.relativedelta import relativedelta
import discord
from discord.ext import commands

from . import CaseInsensitiveDict


__all__ = ('Group', 'group', 'EmojiConverter', 'Emoji', 'CommandConverter', 'Query', 'CleanContent', 'TagName', 'Time')


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


class CleanContent(commands.Converter):
    mass_re = re.compile(r'@(everyone|here)')
    user_re = re.compile(r'<@!?([0-9]+)>')
    role_re = re.compile(r'<@&([0-9]+)>')
    chan_re = re.compile(r'<#([0-9]+)>')

    def __init__(self, *, transform_members=True, use_nicknames=True, transform_roles=True, transform_channels=False,
                 transform_everyone=True):
        self.use_nicknames = use_nicknames
        self.transform_members = transform_members
        self.transform_roles = transform_roles
        self.transform_channels = transform_channels
        self.transform_everyone = transform_everyone

    async def convert(self, ctx, argument):
        def resolve_member(match):
            member_id = int(match.group(1))
            member = ctx.guild.get_member(member_id)
            if member is None:
                return '@deleted-user'

            return f'@{member.display_name}' if self.use_nicknames else f'@{member.name}'

        def resolve_role(match):
            role_id = int(match.group(1))
            role = ctx.guild.get_role(role_id)
            return f'@{role.name}' if role else '@deleted-role'

        def resolve_channel(match):
            channel_id = int(match.group(1))
            channel = ctx.guild.get_channel(channel_id)
            return f'#{channel.name}' if channel else '#deleted-channel'

        tranformations = (
            (self.user_re, resolve_member, self.transform_members),
            (self.role_re, resolve_role, self.transform_roles),
            (self.chan_re, resolve_channel, self.transform_channels),
            (self.mass_re, '@\u200b\\1', self.transform_everyone)
        )

        converted = argument

        for (regex, sub, to_clean) in tranformations:
            if to_clean:
                converted = regex.sub(sub, converted)

        return converted


class TagName(CleanContent):
    def __init__(self, *, lower=False, transform_channels=True, **kwargs):
        super().__init__(transform_channels=transform_channels, **kwargs)
        self.lower = lower

    async def convert(self, ctx, argument):
        converted = await super().convert(ctx, argument)

        if not converted:
            raise commands.BadArgument('Missing tag name.')

        if len(converted) > 100:
            raise commands.BadArgument('Tag name cannot have over 100 characters.')

        return converted.lower() if self.lower else converted


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
