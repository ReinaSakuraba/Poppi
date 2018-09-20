import discord
from discord.ext import commands

import utils


class Xenoblade:
    @utils.group(invoke_without_command=True)
    async def xc1skill(self, ctx, *, name: str):
        """Gives information for a Xenoblade Chronicles skill."""

        query = """
                SELECT
                    name,
                    description,
                    shape,
                    sp_cost,
                    link_cost,
                    effect
                FROM xeno1.skills
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc1skill_search, name=name)

        name, description, shape, sp_cost, link_cost, effect = record

        embed = discord.Embed(title=name, description=description)
        embed.add_field(name='Effect', value=effect, inline=False)
        embed.add_field(name='Shape', value=shape)
        embed.add_field(name='SP Cost', value=sp_cost)
        embed.add_field(name='Link Cost', value=link_cost)

        await ctx.send(embed=embed)

    @xc1skill.command(name='all')
    async def xc1skill_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles skills."""

        await self.all_entries(ctx, 'skills')

    @xc1skill.command(name='search')
    async def xc1skill_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles skill."""

        await self.search_entries(ctx, name, 'skills', type_name='Skill')

    async def search_entries(self, ctx: utils.Context, name: str, *table_names: str, type_name: str):
        base_query = """
                     SELECT name, SIMILARITY(name, $1)
                     FROM xeno1.{0}
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
                     FROM xeno1.{0}
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
    bot.add_cog(Xenoblade())
