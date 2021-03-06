import re
import io
import random

import discord
from discord.ext import commands

import utils


class Meta:
    @commands.command()
    async def avatar(self, ctx, *, member: discord.Member = None):
        """Posts a member's avatar."""

        member = member or ctx.author
        avatar_url = member.avatar_url_as(static_format='png')

        async with ctx.session.get(avatar_url) as r:
            if r.status != 200:
                return await ctx.send('Failed to download avatar.')

            filetype = r.headers.get('Content-Type').partition('/')[-1]
            filename = f'{member.name}.{filetype}'
            file = discord.File(io.BytesIO(await r.read()), filename)
            await ctx.send(file=file)

    @commands.command()
    async def emoji(self, ctx, emoji: utils.EmojiConverter):
        """Posts an enlarged version of a custom emoji."""

        async with ctx.session.get(emoji.url) as r:
            if r.status != 200:
                return await ctx.send('Failed to download emoji.')

            filetype = r.headers.get('Content-Type').partition('/')[-1]
            filename = f'{emoji.name}.{filetype}'
            file = discord.File(io.BytesIO(await r.read()), filename)
            await ctx.send(file=file)

    @commands.command(aliases=['choose'])
    async def decide(self, ctx, *, choices : str):
        """Decides between things for you."""

        if ' or ' in choices:
            choices = choices.split(' or ')
        elif ', ' in choices:
            choices = choices.split(', ')
        else:
            choices = choices.split(',')
        await ctx.send('Obviously, the answer is {}.'.format(random.choice(choices)))

    @commands.command()
    async def roll(self, ctx, die: str):
        """Rolls a die in N#NdN+N format."""

        match = re.match('((?P<times>\d+)#)?(?P<rolls>\d+)d(?P<limit>\d+)(?P<modifier>[+/-]\d+)?', die)
        if match is None:
            return await ctx.send('Format has to be in N#NdN+N!')

        times = int(match.group('times')) if match.group('times') else 1
        rolls = int(match.group('rolls'))
        limit = int(match.group('limit'))
        modifier = match.group('modifier')
        int_modifier = int(modifier) if modifier else 0

        rolls = [[random.randint(1, limit) for r in range(rolls)] for i in range(times)]
        if modifier:
            result = '\n'.join([f'{sum(l) + int_modifier}: ({", ".join(map(str, l))}) {modifier}' for l in rolls])
        else:
            result = '\n'.join([f'{sum(l) + int_modifier}: {", ".join(map(str, l))}' for l in rolls ])

        await ctx.send(result)

    @commands.command()
    async def feedback(self, ctx, *, message: str):
        """Gives feedback about the bot.

        Used to request features or bug fixes.
        """

        channel = ctx.bot.feedback_channel
        if channel is None:
            return

        embed = discord.Embed(title='Feedback', description=message)
        embed.timestamp = ctx.message.created_at
        embed.set_author(name=ctx.author, icon_url=ctx.author.avatar_url)
        embed.set_footer(text=f'Author ID: {ctx.author.id}')

        await channel.send(embed=embed)
        await ctx.send('Successfully sent feedback')

    @commands.command()
    async def support(self, ctx):
        """For supporting the bot and bot creator."""

        await ctx.send('https://www.patreon.com/ReinaSakuraba')


def setup(bot):
    bot.add_cog(Meta())
