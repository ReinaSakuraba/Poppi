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

    @utils.group(invoke_without_command=True)
    async def xc2skill(self, ctx, *, name: str.lower):
        """Gives information for a Xenoblade Chronicles 2 skill."""

        query = """
                SELECT
                    name,
                    driver,
                    description,
                    chart,
                    sp
                FROM xeno2.skills
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name)

        if record is None:
            return await self.show_possibilities(ctx, 'skills', name)

        name, driver, description, chart, sp = record

        embed = discord.Embed(title=name, description=description)
        embed.add_field(name='Driver', value=driver)
        embed.add_field(name='Chart', value=chart)
        embed.add_field(name='SP Needed', value=sp)

        await ctx.send(embed=embed)

    @xc2skill.command(name='all')
    async def xc2skill_all(self, ctx):
        """Lists all Xenoblade Chronicles 2 skills."""

        await self.all_entries(ctx, 'skills')

    @xc2skill.command(name='search')
    async def xc2skill_search(self, ctx, *, name: str):
        """Searches for a Xenoblade Chronicles 2 skill."""

        await self.search_entries(ctx, 'skills', name)

    @xc2skill.error
    @xc2skill_search.error
    async def xc2skill_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing skill name.')

    @utils.group(invoke_without_command=True)
    async def xc2weapon(self, ctx, *, name: str.lower):
        """Gives information for a Xenoblade Chronicles 2 weapon."""

        query = """
                SELECT
                    name,
                    type,
                    rank,
                    damage,
                    '±' || stability,
                    crit_rate || '%',
                    block_rate || '%',
                    effect,
                    chip
                FROM xeno2.weapons
                LEFT JOIN xeno2.chip_weapons
                ON name=weapon
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name)

        if record is None:
            return await self.show_possibilities(ctx, 'weapons', name)

        name, weapon_type, rank, damage, stability, crit_rate, block_rate, effect, chip = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Weapon Type', value=weapon_type)
        embed.add_field(name='Auto-Attack', value=damage)
        embed.add_field(name='Stability', value=stability)
        embed.add_field(name='Crit Rate', value=crit_rate)
        embed.add_field(name='Block Rate', value=block_rate)
        if chip:
            embed.add_field(name='Chip', value=chip)
        if effect:
            embed.add_field(name='Effect', value=effect, inline=False)

        await ctx.send(embed=embed)

    @xc2weapon.command(name='all')
    async def xc2weapon_all(self, ctx):
        """Lists all Xenoblade Chronicles 2 weapons."""

        await self.all_entries(ctx, 'weapons')

    @xc2weapon.command(name='search')
    async def xc2weapon_search(self, ctx, *, name: str):
        """Searches for a Xenoblade Chronicles 2 weapon."""

        await self.search_entries(ctx, 'weapons', name)

    @xc2weapon.error
    @xc2weapon_search.error
    async def xc2weapon_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing weapon name.')

    @utils.group(invoke_without_command=True)
    async def xc2chip(self, ctx, *, name: str.lower):
        """Gives information for a Xenoblade Chronicles 2 core chip."""

        query = """
                SELECT
                    name,
                    rank,
                    sell_price,
                    rarity,
                    STRING_AGG(DISTINCT weapon, E'\n') AS weapons,
                    STRING_AGG(DISTINCT location, E'\n') AS locations
                FROM xeno2.chips
                JOIN xeno2.chip_weapons
                ON chips.name=chip_weapons.chip
                JOIN xeno2.chip_locations
                ON chips.name=chip_locations.chip
                WHERE LOWER(name)=$1
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name)

        if record is None:
            return await self.show_possibilities(ctx, 'chips', name)

        name, rank, sell_price, rarity, weapons, locations = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Rank', value=rank)
        embed.add_field(name='Rarity', value=rarity)
        embed.add_field(name='Sell Price', value=sell_price)
        embed.add_field(name='Locations', value=locations)
        embed.add_field(name='Weapons', value=weapons, inline=False)

        await ctx.send(embed=embed)

    @xc2chip.command(name='all')
    async def xc2chip_all(self, ctx):
        """Lists all Xenoblade Chronicles 2 core chips."""

        await self.all_entries(ctx, 'chips')

    @xc2chip.command(name='search')
    async def xc2chip_search(self, ctx, *, name: str):
        """Searches for a Xenoblade Chronicles 2 core chip."""

        await self.search_entries(ctx, 'chips', name)

    @xc2chip.error
    @xc2chip_search.error
    async def xc2chip_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing core chip name.')

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
