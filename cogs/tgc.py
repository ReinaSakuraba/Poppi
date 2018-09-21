import discord
from discord.ext import commands

import utils


class TheGoldenCountry:
    @utils.group(invoke_without_command=True)
    async def tgccraft(self, ctx, *, name: str):
        """Gives information for a The Golden Country craft."""

        query = """
                SELECT
                    driver,
                    name,
                    description,
                    STRING_AGG(item, E'\n')
                FROM tgc.crafts
                JOIN tgc.pouch_item_crafts
                ON name=craft
                WHERE LOWER(name)=$1
                GROUP BY driver, name, description;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.tgccraft_search, name=name)

        driver, name, description, items = record

        embed = discord.Embed(title=name, description=description)
        embed.add_field(name='Driver', value=driver, inline=False)
        embed.add_field(name='Craftable Items', value=items)

        await ctx.send(embed=embed)

    @tgccraft.command(name='all')
    async def tgccraft_all(self, ctx: utils.Context):
        """Lists all The Golden Country crafts."""

        await self.all_entries(ctx, 'crafts')

    @tgccraft.command(name='search')
    async def tgccraft_search(self, ctx: utils.Context, *, name: str):
        """Searches for a The Golden Country craft."""

        await self.search_entries(ctx, name, 'crafts', type_name='Craft')

    async def search_entries(self, ctx: utils.Context, name: str, *table_names: str, type_name: str):
        base_query = """
                     SELECT name, SIMILARITY(name, $1)
                     FROM tgc.{0}
                     WHERE name % $1
                     """

        formatted_query = "UNION".join(base_query.format(table_name) for table_name in table_names)

        query = f"""
                SELECT DISTINCT name, similarity
                FROM (
                    {formatted_query}
                ) AS a
                ORDER BY similarity DESC;
                """

        results = [f'{index}: {name}' for index, (name, _) in enumerate(await ctx.pool.fetch(query, name), 1)]

        if not results:
            return await ctx.send(f'{type_name} not found.')

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    async def all_entries(self, ctx: utils.Context, *table_names: str):
        base_query = """
                     SELECT name
                     FROM tgc.{0}
                     """

        formatted_query = "UNION".join(base_query.format(table_name) for table_name in table_names)

        query = f"""
                SELECT DISTINCT name
                FROM (
                    {formatted_query}
                ) AS a
                ORDER BY name;
                """

        results = [f'{index}: {name}' for index, (name,) in enumerate(await ctx.pool.fetch(query), 1)]

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)


def setup(bot):
    bot.add_cog(TheGoldenCountry())
