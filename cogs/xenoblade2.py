import math

import discord
from discord.ext import commands

from bot import Bot
import utils


class Xenoblade2:
    @utils.group(invoke_without_command=True)
    async def xc2art(self, ctx: utils.Context, *, name: str):
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
                    distance || ' meters',
                    radius || ' meters',
                    hate,
                    '+' || accuracy_mod || '%',
                    '+' || crit_mod || '%'
                FROM xeno2.arts
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'arts', name)

        name, driver, weapon, type_, damage_ratio, hits, range_, recharge, reaction, description, wp, caption, distance, radius, hate, accuracy_mod, crit_mod = record

        types = {
            'Physical': 'Damage Ratio',
            'Ether': 'Damage Ratio',
            'Recovery': 'Rate of Healing',
            'Defensive': 'Active Period'
        }

        if type_ == 'Defensive':
            damage_ratio = '/'.join([str(int(int(ratio) / 30)) for ratio in damage_ratio.split('/')])

        embed = discord.Embed(title=name, description=caption)
        embed.add_field(name='Driver', value=driver)
        embed.add_field(name='Weapon', value=weapon)
        embed.add_field(name='Type', value=type_)
        embed.add_field(name='Hits', value=hits)
        embed.add_field(name='Range', value=range_)
        embed.add_field(name='Recharge', value=recharge)
        embed.add_field(name=types[type_], value=damage_ratio, inline=False)
        if description:
            embed.add_field(name='Decription', value=description, inline=False)
        embed.add_field(name='Reaction', value=reaction)
        embed.add_field(name='Distance', value=distance)
        embed.add_field(name='Radius', value=radius)
        embed.add_field(name='Aggro', value=hate)
        embed.add_field(name='Accuracy Modifier', value=accuracy_mod)
        embed.add_field(name='Crit Modifier', value=crit_mod)
        embed.add_field(name='WP', value=wp)

        await ctx.send(embed=embed)

    @xc2art.command(name='all')
    async def xc2art_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 arts."""

        await self.all_entries(ctx, 'arts')

    @xc2art.command(name='search')
    async def xc2art_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 art."""

        await self.search_entries(ctx, 'arts', name)

    @xc2art.error
    @xc2art_search.error
    async def xc2art_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing art name.')

    @utils.group(invoke_without_command=True)
    async def xc2special(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 special."""

        query = """
                SELECT
                    name,
                    level,
                    type,
                    damage_ratio,
                    hits,
                    range,
                    reaction,
                    description,
                    caption,
                    distance || ' meters',
                    radius || ' meters',
                    hate,
                    '+' || accuracy_mod || '%',
                    '+' || crit_mod || '%'
                FROM xeno2.specials
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'specials', name)

        name, level, type_, damage_ratio, hits, range_, reaction, description, caption, distance, radius, hate, accuracy_mod, crit_mod = record

        embed = discord.Embed(title=name, description=caption)
        embed.add_field(name='Type', value=type_)
        embed.add_field(name='Hits', value=hits)
        embed.add_field(name='Range', value=range_)
        embed.add_field(name='Special Level', value=level)
        embed.add_field(name='Reaction', value=reaction)
        embed.add_field(name='Distance', value=distance)
        embed.add_field(name='Radius', value=radius)
        embed.add_field(name='Aggro', value=hate)
        embed.add_field(name='Accuracy Modifier', value=accuracy_mod)
        embed.add_field(name='Crit Modifier', value=crit_mod)
        embed.add_field(name='Damage Ratio', value=damage_ratio, inline=False)
        if description:
            embed.add_field(name='Decription', value=description, inline=False)

        await ctx.send(embed=embed)

    @xc2special.command(name='all')
    async def xc2special_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 specials."""

        await self.all_entries(ctx, 'specials')

    @xc2special.command(name='search')
    async def xc2special_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 special."""

        await self.search_entries(ctx, 'specials', name)

    @xc2special.error
    @xc2special_search.error
    async def xc2special_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing special name.')

    @utils.group(invoke_without_command=True)
    async def xc2skill(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 skill."""

        query = """
                SELECT
                    name,
                    driver,
                    xeno2.format_caption(enhance_captions.caption, param, param_one, param_two),
                    chart,
                    sp
                FROM xeno2.skills
                JOIN xeno2.enhance
                ON skills.caption=enhance.id
                JOIN xeno2.enhance_captions
                ON enhance.caption=enhance_captions.id
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'skills', name)

        name, driver, description, chart, sp = record

        embed = discord.Embed(title=name, description=description)
        embed.add_field(name='Driver', value=driver)
        embed.add_field(name='Chart', value=chart)
        embed.add_field(name='SP Needed', value=sp)

        await ctx.send(embed=embed)

    @xc2skill.command(name='all')
    async def xc2skill_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 skills."""

        await self.all_entries(ctx, 'skills')

    @xc2skill.command(name='search')
    async def xc2skill_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 skill."""

        await self.search_entries(ctx, 'skills', name)

    @xc2skill.error
    @xc2skill_search.error
    async def xc2skill_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing skill name.')

    @utils.group(invoke_without_command=True)
    async def xc2weapon(self, ctx: utils.Context, *, name: str):
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

        record = await ctx.pool.fetchrow(query, name.lower())

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
    async def xc2weapon_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 weapons."""

        await self.all_entries(ctx, 'weapons')

    @xc2weapon.command(name='search')
    async def xc2weapon_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 weapon."""

        await self.search_entries(ctx, 'weapons', name)

    @xc2weapon.error
    @xc2weapon_search.error
    async def xc2weapon_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing weapon name.')

    @utils.group(invoke_without_command=True)
    async def xc2chip(self, ctx: utils.Context, *, name: str):
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
                WHERE LOWER(name)=$1 || ' chip'
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower().replace(' chip', ''))

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
    async def xc2chip_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 core chips."""

        await self.all_entries(ctx, 'chips')

    @xc2chip.command(name='search')
    async def xc2chip_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 core chip."""

        await self.search_entries(ctx, 'chips', name)

    @xc2chip.error
    @xc2chip_search.error
    async def xc2chip_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing core chip name.')

    @utils.group(invoke_without_command=True, aliases=['xc2aux'])
    async def xc2core(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 aux core."""

        query = """
                SELECT
                    name,
                    effect,
                    'Unrefined: ' || unrefined_sell_price || E'\n'
                    'Refined: ' || refined_sell_price AS sell_price,
                    rarity,
                    CASE WHEN material_type='Specific'
                         THEN STRING_AGG(material || ' x' || amount, E'\n')
                         ELSE material_type || ' x' || material_amount
                    END AS materials
                FROM xeno2.cores
                LEFT JOIN xeno2.core_materials
                ON name=core
                WHERE LOWER(name)=$1
                GROUP BY name
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'cores', name)

        name, effect, sell_price, rarity, materials = record

        embed = discord.Embed(title=name, description=effect)
        embed.add_field(name='Rarity', value=rarity)
        embed.add_field(name='Sell Price', value=sell_price)
        embed.add_field(name='Refining Materials', value=materials)

        await ctx.send(embed=embed)

    @xc2core.command(name='all')
    async def xc2core_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 aux cores."""

        await self.all_entries(ctx, 'cores')

    @xc2core.command(name='search')
    async def xc2core_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 aux core."""

        await self.search_entries(ctx, 'cores', name)

    @xc2core.error
    @xc2core_search.error
    async def xc2core_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing aux core name.')

    @utils.group(invoke_without_command=True, aliases=['xc2acc'])
    async def xc2accessory(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 accessory."""

        query = """
                SELECT
                    name,
                    rarity,
                    xeno2.format_caption(enhance_captions.caption, param, param_one, param_two) AS caption
                FROM xeno2.accessories
                JOIN xeno2.enhance
                ON accessories.caption=enhance.id
                JOIN xeno2.enhance_captions
                ON enhance.caption=enhance_captions.id
                WHERE LOWER(name)=$1;
                """

        records = await ctx.pool.fetch(query, name.lower())

        if not records:
            return await self.show_possibilities(ctx, 'accessories', name)

        embed = discord.Embed(title=records[0]['name'])

        for row in records:
            embed.add_field(name=row['rarity'], value=row['caption'], inline=False)

        await ctx.send(embed=embed)

    @xc2accessory.command(name='all')
    async def xc2accessory_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 accessories."""

        await self.all_entries(ctx, 'accessories')

    @xc2accessory.command(name='search')
    async def xc2accessory_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 accessory."""

        await self.search_entries(ctx, 'accessories', name)

    @xc2accessory.error
    @xc2accessory_search.error
    async def xc2accessory_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing accessory name.')

    @utils.group(invoke_without_command=True)
    async def xc2pouch(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 pouch item."""

        query = """
                SELECT
                    name,
                    category,
                    sell_price,
                    rarity,
                    location,
                    max_carry,
                    time,
                    trust,
                    STRING_AGG(xeno2.format_caption(pouch_captions.caption, param), E'\n') AS effects
                FROM xeno2.pouch_items
                JOIN xeno2.pouch_item_effects
                ON name=pouch_item
                JOIN xeno2.pouch_captions
                ON pouch_captions.id=pouch_item_effects.caption
                WHERE LOWER(name)=$1
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'pouch_items', name)

        name, category, sell_price, rarity, location, max_carry, time, trust, effects = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Category', value=category)
        embed.add_field(name='Rarity', value=rarity)
        embed.add_field(name='Sell Price', value=sell_price)
        embed.add_field(name='Location', value=location)
        embed.add_field(name='Max Carry', value=max_carry)
        embed.add_field(name='Trust', value=trust)
        embed.add_field(name='Effect Time', value=f'{time} minutes')
        embed.add_field(name='Effects', value=effects, inline=False)

        await ctx.send(embed=embed)

    @xc2pouch.command(name='all')
    async def xc2pouch_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 pouch items."""

        await self.all_entries(ctx, 'pouch_items')

    @xc2pouch.command(name='search')
    async def xc2pouch_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 pouch item."""

        await self.search_entries(ctx, 'pouch_items', name)

    @xc2pouch.error
    @xc2pouch_search.error
    async def xc2pouch_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing pouch item name.')

    @utils.group(invoke_without_command=True)
    async def xc2class(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 class."""

        query = """
                SELECT
                    name,
                    STRING_AGG(role, E'\n'),
                    damage_given,
                    damage_recieved,
                    healing_given,
                    auto_attack_aggro,
                    arts_aggro,
                    potion_collect,
                    prioritize_revive
                FROM xeno2.classes
                JOIN xeno2.class_roles
                ON name=class
                WHERE LOWER(name)=$1
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await self.show_possibilities(ctx, 'classes', name)

        name, roles, given, recieved, heal, auto, arts, potion, revive = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Damage Dealt', value=f'{given:+d}%')
        embed.add_field(name='Damage Recieved', value=f'{-recieved:+d}%')
        embed.add_field(name='Healing', value=f'{heal:+d}%')
        embed.add_field(name='Auto-Attack Aggro', value=f'{auto:+d}')
        embed.add_field(name='Arts Aggro', value=f'{arts:+d}')
        embed.add_field(name='Collect Potions', value=potion)
        embed.add_field(name='Prioritize Revival', value=revive)
        embed.add_field(name='Roles', value=roles, inline=False)

        await ctx.send(embed=embed)

    @xc2class.command(name='all')
    async def xc2class_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 classes."""

        await self.all_entries(ctx, 'classes')

    @xc2class.command(name='search')
    async def xc2class_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 class."""

        await self.search_entries(ctx, 'classes', name)

    @xc2class.error
    @xc2class_search.error
    async def xc2class_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing class name.')

    @commands.command()
    async def xc2pull(self, ctx, blade: str, luck: int, idea_level: int, core: str = 'Common'):
        """Shows chances for pulling a blade in Xenoblade Chronicles 2."""

        cores = {
            'legendary': 3,
            'rare': 1.5,
            'common': 1
        }

        try:
            core_multiplier = cores[core.lower()]
        except KeyError:
            return await ctx.send('Invalid core.')

        luck_multiplier = max(math.sqrt(luck) * 0.01 * 1.3 + 0.95, 1)
        idea_multiplier = 1 + 0.05 * idea_level

        query = """
                SELECT
                    seed,
                    (probability * ROUND($2::numeric * $3 * $4, 2))::float || '%'
                FROM xeno2.blade_chances
                WHERE LOWER(blade)=$1;
                """

        results = await ctx.pool.fetch(query, blade.lower(), core_multiplier, luck_multiplier, idea_multiplier)

        if not results:
            return await ctx.send('This is not a pullable Blade.')

        table = utils.TabularData()
        table.set_columns(('Seed', 'Probability'))
        table.add_rows(list(r.values()) for r in results)
        render = table.render()

        await ctx.send(f'```\n{render}\n```')

    async def show_possibilities(self, ctx: utils.Context, table_name: str, name: str):
        query = f"""
                SELECT
                    STRING_AGG(name, E'\n' ORDER BY SIMILARITY(name, $1) DESC)
                FROM (
                    SELECT name
                    FROM xeno2.{table_name}
                    WHERE name % $1
                    GROUP BY name
                ) AS a;
                """

        possibilities = await ctx.pool.fetchval(query, name)

        if table_name == 'accessories':
            type_name='Accessory'
        else:
            strip = 2 if table_name == 'classes' else 1
            type_name = table_name[:-strip].replace('_', ' ').title()

        if not possibilities:
            return await ctx.send(f'{type_name} not found.')

        await ctx.send(f'{type_name} not found. Did you mean...\n{possibilities}')

    async def search_entries(self, ctx: utils.Context, table_name: str, name: str):
        query = f"""
                SELECT ARRAY(
                    SELECT name
                    FROM xeno2.{table_name}
                    WHERE name % $1
                    GROUP BY name
                    ORDER BY SIMILARITY(name, $1) DESC
                );
                """

        results = [f'{index}: {row}' for index, row in enumerate(await ctx.pool.fetchval(query, name), 1)]

        if not results:
            if table_name == 'accessories':
                type_name='Accessory'
            else:
                strip = 2 if table_name == 'classes' else 1
                type_name = table_name[:-strip].replace('_', ' ').title()

            return await ctx.send(f'{type_name} not found.')

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    async def all_entries(self, ctx: utils.Context, table_name: str):
        query = f"""
                SELECT ARRAY(
                    SELECT DISTINCT name
                    FROM xeno2.{table_name}
                    ORDER BY name
                );
                """

        results = [f'{index}: {row}' for index, row in enumerate(await ctx.pool.fetchval(query), 1)]

        try:
            paginator = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)


def setup(bot: Bot):
    bot.add_cog(Xenoblade2())
