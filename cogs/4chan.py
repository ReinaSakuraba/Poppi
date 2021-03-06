import random
import datetime

import discord
from discord.ext import commands
import html2text
from discord.ext.commands.cooldowns import BucketType


class Chan:
    parser = html2text.HTML2Text()

    @commands.cooldown(1, 1, BucketType.default)
    @commands.command(name='4chan')
    async def four_chan(self, ctx, board):
        """Posts a random post from 4chan."""

        async with ctx.session.get(f'https://a.4cdn.org/{board}/1.json') as r:
            if r.status != 200:
                return await ctx.send('Invalid board given.')

            data = await r.json()

        await ctx.send(embed=self.get_random_post(data, board))

    @four_chan.error
    async def four_chan_error(self, ctx, exception):
        if isinstance(exception, commands.CommandOnCooldown):
            await ctx.send(exception)

    def get_random_post(self, data, board):
        thread = random.choice(data['threads'])
        post = random.choice(thread['posts'])
        comment = post.get('com')

        if comment is None:
            return self.get_random_post(data, board)

        parsed_comment = self.parser.handle(comment)

        if len(parsed_comment) > 2000:
            return self.get_random_post(data, board)

        no = post['no']
        resto = post['resto'] if post['resto'] != 0 else no

        embed = discord.Embed()
        embed.description = parsed_comment
        embed.set_author(name=post['name'])
        embed.timestamp = datetime.datetime.fromtimestamp(post['time'])
        embed.title = f'No. {no}'
        embed.url = f'https://boards.4chan.org/{board}/thread/{resto}#p{no}'

        try:
            filename = f'{post["filename"]}{post["ext"]}'
            fileurl = f'https://i.4cdn.org/{board}/{post["tim"]}{post["ext"]}'
        except KeyError:
            pass
        else:
            embed.add_field(name='Attachment', value=f'[{filename}]({fileurl})')

        return embed


def setup(bot):
    bot.add_cog(Chan())
