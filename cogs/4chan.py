import random

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

        await ctx.send(self.get_random_post(data))

    @four_chan.error
    async def four_chan_error(self, ctx, exception):
        if isinstance(exception, commands.CommandOnCooldown):
            await ctx.send(exception)

    def get_random_post(self, data):
        thread = random.choice(data['threads'])
        post = random.choice(thread['posts'])
        comment = post.get('com')

        if comment is None:
            return self.get_random_post(data)

        return self.parser.handle(comment)


def setup(bot):
    bot.add_cog(Chan())
