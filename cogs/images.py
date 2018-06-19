import io
import re
import math
import random
import functools
from collections import defaultdict

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

    @commands.command()
    async def oil(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='png', size=256)) as r:
            f = io.BytesIO(await r.read())

            func = functools.partial(self._oil, f, 3, 20)
            file = await utils.run_in_executor(func, loop=ctx.bot.loop)

            await ctx.send(file=discord.File(file, 'oil.png'))

    def dist(self, a, b):
        return math.sqrt(sum((c - d) ** 2 for c, d in zip(a, b)))

    def _oil(self, data, radius, levels):
        with Image.open(data) as image:
            with Image.new('RGB', image.size) as out:
                pixels = image.load()
                out_pixels = out.load()
                width, height = image.size

                for x in range(width):
                    for y in range(height):
                        x_min = max(x - radius, 0)
                        x_max = min(x + radius, width)
                        y_min = max(y - radius, 0)
                        y_max = min(y + radius, height)

                        avgR = defaultdict(int)
                        avgG = defaultdict(int)
                        avgB = defaultdict(int)
                        count = defaultdict(int)

                        for x_sub in range(x_min, x_max):
                            for y_sub in range(y_min, y_max):
                                if self.dist((x, y), (x_sub, y_sub)) <= radius:
                                    r, g, b, *_ = pixels[x_sub, y_sub]
                                    lvl = int((((r + g + b) / 3) * levels) / 255)

                                    count[lvl] += 1
                                    avgR[lvl] += r
                                    avgG[lvl] += g
                                    avgB[lvl] += b

                        countmaxkey = max(count.keys(), key=lambda a: count[a])
                        countmax = count[countmaxkey]

                        finR = int(avgR[countmaxkey] / countmax)
                        finG = int(avgG[countmaxkey] / countmax)
                        finB = int(avgB[countmaxkey] / countmax)

                        out_pixels[x, y] = (finR, finG, finB)

                b = io.BytesIO()
                out.save(b, format='png')
                b.seek(0)
                return b

    @commands.command()
    async def stylize(self, ctx, member: discord.Member = None, intensity: int = 5):
        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='png')) as r:
            f = io.BytesIO(await r.read())

            func = functools.partial(self._stylize, f, intensity)
            file = await utils.run_in_executor(func, loop=ctx.bot.loop)

            await ctx.send(file=discord.File(file, 'stylized.png'))

    def _stylize(self, data, intensity):
        with Image.open(data) as image:
            quantized_image = image.quantize(intensity)

            b = io.BytesIO()
            quantized_image.save(b, format='png')
            b.seek(0)
            return b

    @commands.command()
    async def scoop(self, ctx, member: discord.Member = None, intensity: int = 5):
        member = member or ctx.author

        async with ctx.session.get(member.avatar_url_as(format='png')) as r:
            f = io.BytesIO(await r.read())

            func = functools.partial(self._scoop, f, intensity)
            file = await utils.run_in_executor(func, loop=ctx.bot.loop)

            await ctx.send(file=discord.File(file, 'stylized.png'))

    def _scoop(self, data, intensity):
        with Image.open(data).convert('RGB') as image:
            quantized_image = image.quantize(intensity, method=1)

            b = io.BytesIO()
            quantized_image.save(b, format='png')
            b.seek(0)
            return b


def setup(bot):
    bot.add_cog(Images())
