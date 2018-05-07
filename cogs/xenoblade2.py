import discord
from discord.ext import commands

import utils


class Xenoblade2:
    @utils.group(invoke_without_command=True)
    async def xc2art(self, ctx, *, name: str.lower):
        """Gives information for a Xenoblade Chronicles 2 art."""

        query = """
                SELECT
                    name,
                    driver,
                    weapon,
                    type,
                    damage_ratio,
                    hits,
                    range,
                    recharge,
                    reaction,
                    description,
                    wp,
                    caption,
                    distance,
                    hate
                FROM xeno2.arts
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name)

        if record is None:
            return await self.show_possibilities(ctx, 'arts', name)

        name, driver, weapon, type_, damage_ratio, hits, range_, recharge, reaction, description, wp, caption, distance, hate = record

        embed = discord.Embed(title=name, description=caption)
        embed.add_field(name='Driver', value=driver)
        embed.add_field(name='Weapon', value=weapon)
        embed.add_field(name='Type', value=type_)
        embed.add_field(name='Hits', value=hits)
        embed.add_field(name='Range', value=range_)
        embed.add_field(name='Recharge', value=recharge)
        embed.add_field(name='Damage Ratio', value=damage_ratio, inline=False)
        if description:
            embed.add_field(name='Decription', value=description, inline=False)
        embed.add_field(name='Reaction', value=reaction)
        embed.add_field(name='Distance', value=distance)
        embed.add_field(name='Hate', value=hate)
        embed.add_field(name='WP', value=wp)

        await ctx.send(embed=embed)

    @xc2art.command(name='all')
    async def xc2art_all(self, ctx):
        """Lists all Xenoblade Chronicles 2 arts."""

        await self.all_entries(ctx, 'arts')

    @xc2art.command(name='search')
    async def xc2art_search(self, ctx, *, name: str):
        """Searches for a Xenoblade Chronicles 2 art."""

        await self.search_entries(ctx, 'arts', name)

    @xc2art.error
    @xc2art_search.error
    async def xc2art_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing art name.')

    async def show_possibilities(self, ctx, table_name, name):
        query = f"""
                SELECT
                    STRING_AGG(name, E'\n' ORDER BY SIMILARITY(name, $1) DESC)
                FROM xeno2.{table_name}
                WHERE name % $1;
                """

        possibilities = await ctx.pool.fetchval(query, name)

        strip = 2 if table_name.endswith('es') else 1
        type_name = table_name[:-strip].title()

        if not possibilities:
            return await ctx.send(f'{type_name} not found.')

        await ctx.send(f'{type_name} not found. Did you mean...\n{possibilities}')

    async def search_entries(self, ctx, table_name, name):
        query = f"""
                SELECT ARRAY(
                    SELECT name
                    FROM xeno2.{table_name}
                    WHERE name % $1
                    ORDER BY SIMILARITY(name, $1) DESC
                );
                """

        results = [f'{index}: {row}' for index, row in enumerate(await ctx.pool.fetchval(query, name), 1)]

        if not results:
            strip = 2 if table_name.endswith('es') else 1
            type_name = table_name[:-strip].title()
            return await ctx.send(f'{type_name} not found.')

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    async def all_entries(self, ctx, table_name):
        query = f"""
                SELECT ARRAY(
                    SELECT name
                    FROM xeno2.{table_name}
                );
                """

        results = [f'{index}: {row}' for index, row in enumerate(await ctx.pool.fetchval(query), 1)]

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)


def setup(bot):
    bot.add_cog(Xenoblade2())
