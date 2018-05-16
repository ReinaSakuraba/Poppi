import io
import re
import random
import functools

import discord
from discord.ext import commands
from PIL import Image, ImageOps, ImageFilter

import utils


class Images:
    """Image related commands"""

    @commands.command()
    async def invert(self, ctx, *, member: discord.Member = None):
        """Inverts an image."""

        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='png')) as r:
            with io.BytesIO(await r.read()) as f:
                func = functools.partial(self.invert_image, f)
                file = await utils.run_in_executor(func, loop=ctx.bot.loop)

                await ctx.send(file=discord.File(file, f'inverted.png'))

    def invert_image(self, file):
        with Image.open(file) as image:
            if image.mode == 'RGBA':
                r, g, b, a = image.split()
                r, g, b = map(lambda image: image.point(lambda p: 255 - p), (r, g, b))
                inverted_image = Image.merge(image.mode, (r, g, b, a))
            else:
                inverted_image = ImageOps.invert(image)

            f = io.BytesIO()
            inverted_image.save(f, format='png')
            f.seek(0)

            return f

    @commands.command()
    async def needsmorejpeg(self, ctx, *, member: discord.Member = None):
        """Lowers the quality of an image to its minimum."""

        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='jpg')) as r:
            with Image.open(io.BytesIO(await r.read())) as image:
                file = io.BytesIO()
                image.save(file, format='jpeg', quality=1)
                file.seek(0)

                await ctx.send(file=discord.File(file, 'needsmore.jpeg'))

    @commands.command()
    async def edge(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='png')) as r:
            with io.BytesIO(await r.read()) as f:
                func = functools.partial(self.make_edge, f)
                file = await utils.run_in_executor(func, loop=ctx.bot.loop)

                await ctx.send(file=discord.File(file, 'edge.png'))

    def make_edge(self, file):
        with Image.open(file).convert('RGB') as image:
            horizontal = image.filter(ImageFilter.Kernel((3, 3), [-1, 0, 1, -1, 0, 1, -1, 0, 1], 1.0))
            vertical = image.filter(ImageFilter.Kernel((3, 3), [-1, -1, -1, 0, 0, 0, 1, 1, 1], 1.0))
            modified = Image.blend(horizontal, vertical, 0.5)

            f = io.BytesIO()
            modified.save(f, format='png')
            f.seek(0)

            return f

    @commands.command()
    async def retro(self, ctx, line_1: str, line_2: str = '', *, line_3: str = ''):
        if not re.fullmatch(r'[A-Za-z0-9 ]+', line_1):
            return await ctx.send('First line only supports alphanumerical characters.')

        data = {
            'bcg': random.randint(1, 5),
            'txt': random.randint(1, 4),
            'text1': line_1,
            'text2': line_2,
            'text3': line_3,
        }

        async with ctx.session.post('https://photofunia.com/effects/retro-wave', data=data) as r:
            txt = await r.text()

        link = re.search(r'(https?.+?\.jpg\?download)', txt)
        async with ctx.session.get(link.group(1)) as r:
            await ctx.send(file=discord.File(io.BytesIO(await r.read()), 'retro.jpg'))

    @commands.command()
    async def moom(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        await self.mirror(ctx, member.avatar_url_as(format='png'))

    @commands.command()
    async def dood(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        await self.mirror(ctx, member.avatar_url_as(format='png'))

    async def mirror(self, ctx, link):
        async with ctx.session.get(link) as r:
            with io.BytesIO(await r.read()) as f:
                func = functools.partial(self.mirror_image, f, ctx.command.name)
                file = await utils.run_in_executor(func, loop=ctx.bot.loop)

                await ctx.send(file=discord.File(file, f'{ctx.command.name}.png'))

    def mirror_image(self, file, command_name):
        with Image.open(file) as image:
            width, height = image.size

            if command_name == 'dood':
                left = image.crop((0, 0, width / 2, height))
            else:
                left = ImageOps.mirror(image.crop((width / 2, 0, width, height)))
            right = ImageOps.mirror(left)
            final = Image.new('RGB', image.size)
            final.paste(left)
            final.paste(right, (int(width / 2), 0))

            f = io.BytesIO()
            final.save(f, format='png')
            f.seek(0)

            return f



def setup(bot):
    bot.add_cog(Images())
