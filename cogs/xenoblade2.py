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
                WITH hidden_hits AS (
                    SELECT art, hit
                    FROM xeno2.art_ratios
                    WHERE ratio=255
                ), hit_data AS (
                    SELECT
                        art_hit_frames.art,
                        art_hit_frames.hit - (
                            SELECT COUNT(*)
                            FROM hidden_hits
                            WHERE hidden_hits.art=art_hit_frames.art
                            AND hidden_hits.hit < art_hit_frames.hit
                        ) AS hit,
                        hit_frame,
                        reaction,
                        ROUND(COALESCE(ratio, 1)::numeric / SUM(COALESCE(ratio, 1)::numeric) OVER (PARTITION BY art_hit_frames.art) * 100, 2) AS ratio
                    FROM xeno2.art_hit_frames
                    LEFT JOIN hidden_hits
                    ON art_hit_frames.art=hidden_hits.art
                    AND art_hit_frames.hit=hidden_hits.hit
                    LEFT JOIN xeno2.art_reactions
                    ON art_hit_frames.art=art_reactions.art
                    AND art_hit_frames.hit=art_reactions.hit
                    LEFT JOIN xeno2.art_ratios
                    ON art_hit_frames.art=art_ratios.art
                    AND art_hit_frames.hit=art_ratios.hit
                    WHERE hidden_hits.hit IS NULL
                )
                SELECT
                    name,
                    driver,
                    weapon,
                    type,
                    damage_ratio,
                    COUNT(hit) AS hits,
                    range,
                    recharge,
                    STRING_AGG(DISTINCT reaction, ' / ') AS reactions,
                    (
                        SELECT
                            xeno2.format_caption(
                                enhance_captions.caption,
                                param,
                                '[' || STRING_AGG(param_one::float::text, '/' ORDER BY level) || ']',
                                '[' || STRING_AGG(param_two::float::text, '/' ORDER BY level) || ']'
                            ) AS caption
                        FROM xeno2.art_enhance
                        JOIN xeno2.enhance
                        ON art_enhance.caption=enhance.id
                        JOIN xeno2.enhance_captions
                        ON enhance.caption=enhance_captions.id
                        WHERE art=name
                        GROUP BY enhance_captions.caption, param
                    ),
                    wp,
                    caption,
                    distance || ' meters',
                    radius || ' meters',
                    hate,
                    '+' || accuracy_mod || '%',
                    '+' || crit_mod || '%',
                    STRING_AGG(hit || ': ' || hit_frame, E'\n' ORDER BY hit) AS hit_frames,
                    STRING_AGG(hit || ': ' || reaction, E'\n' ORDER BY hit) AS reaction_data,
                    STRING_AGG(hit || ': ' || ratio::float::text || '%', E'\n' ORDER BY hit) AS ratios
                FROM xeno2.arts
                LEFT JOIN hit_data
                ON name=art
                WHERE LOWER(name)=$1
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2art_search, name=name)

        name, driver, weapon, type_, damage_ratio, hits, range_, recharge, reaction, description, wp, caption, distance, radius, hate, accuracy_mod, crit_mod, hit_frames, reaction_data, ratios = record

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
        embed.add_field(name='WP', value=wp, inline=False)
        if hit_frames:
            embed.add_field(name='Hit Frames', value=hit_frames)
        if reaction_data:
            embed.add_field(name='Hit Reactions', value=reaction_data)
        if hits > 1:
            embed.add_field(name='Damage Distribution', value=ratios)

        await ctx.send(embed=embed)

    @xc2art.command(name='all')
    async def xc2art_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 arts."""

        await utils.all_entries(ctx, 'xeno2', 'arts')

    @xc2art.command(name='search')
    async def xc2art_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 art."""

        await utils.search_entries(ctx, 'xeno2', name, 'arts', type_name='Art')

    @xc2art.error
    @xc2art_search.error
    async def xc2art_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing art name.')

    @utils.group(invoke_without_command=True)
    async def xc2special(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 special."""

        query = """
                WITH hidden_hits AS (
                    SELECT special, hit
                    FROM xeno2.special_ratios
                    WHERE ratio=255
                ), hit_data AS (
                    SELECT
                        special_hit_frames.special,
                        special_hit_frames.hit - (
                            SELECT COUNT(*)
                            FROM hidden_hits
                            WHERE hidden_hits.special=special_hit_frames.special
                            AND hidden_hits.hit < special_hit_frames.hit
                        ) AS hit,
                        hit_frame,
                        reaction,
                        ROUND(COALESCE(ratio, 1)::numeric / SUM(COALESCE(ratio, 1)::numeric) OVER (PARTITION BY special_hit_frames.special) * 100, 2) AS ratio
                    FROM xeno2.special_hit_frames
                    LEFT JOIN hidden_hits
                    ON special_hit_frames.special=hidden_hits.special
                    AND special_hit_frames.hit=hidden_hits.hit
                    LEFT JOIN xeno2.special_reactions
                    ON special_hit_frames.special=special_reactions.special
                    AND special_hit_frames.hit=special_reactions.hit
                    LEFT JOIN xeno2.special_ratios
                    ON special_hit_frames.special=special_ratios.special
                    AND special_hit_frames.hit=special_ratios.hit
                    WHERE hidden_hits.hit IS NULL
                ), damage_ratios AS (
                    SELECT special, STRING_AGG(damage_ratio::text, '/' ORDER BY level) AS damage_ratio
                    FROM xeno2.special_damage_ratios
                    GROUP BY special
                )
                SELECT
                    name,
                    specials.level,
                    blade,
                    type,
                    damage_ratio,
                    COUNT(hit) AS hits,
                    range,
                    STRING_AGG(DISTINCT reaction, ' / ') AS reactions,
                    (
                        SELECT
                            xeno2.format_caption(
                                enhance_captions.caption,
                                param,
                                '[' || STRING_AGG(param_one::float::text, '/' ORDER BY level) || ']',
                                '[' || STRING_AGG(param_two::float::text, '/' ORDER BY level) || ']'
                            ) AS caption
                        FROM xeno2.special_enhance
                        JOIN xeno2.enhance
                        ON special_enhance.caption=enhance.id
                        JOIN xeno2.enhance_captions
                        ON enhance.caption=enhance_captions.id
                        WHERE special=name
                        GROUP BY enhance_captions.caption, param
                    ),
                    caption,
                    distance || ' meters',
                    radius || ' meters',
                    hate,
                    '+' || accuracy_mod || '%',
                    '+' || crit_mod || '%',
                    STRING_AGG(hit || ': ' || hit_frame, E'\n' ORDER BY hit) AS hit_frames,
                    STRING_AGG(hit || ': ' || reaction, E'\n' ORDER BY hit) AS reaction_data,
                    STRING_AGG(hit || ': ' || ratio::float::text || '%', E'\n' ORDER BY hit) AS ratios
                FROM xeno2.specials
                JOIN damage_ratios
                ON name=damage_ratios.special
                LEFT JOIN hit_data
                ON name=hit_data.special
                LEFT JOIN xeno2.blade_specials
                ON name=blade_specials.special
                WHERE LOWER(name)=$1
                GROUP BY name, damage_ratio, blade;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2special_search, name=name)

        name, level, blade, type_, damage_ratio, hits, range_, reaction, description, caption, distance, radius, hate, accuracy_mod, crit_mod, hit_frames, reaction_data, ratios = record

        embed = discord.Embed(title=name, description=caption)
        embed.add_field(name='Type', value=type_)
        if blade:
            embed.add_field(name='Blade', value=blade)
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
        if hit_frames:
            embed.add_field(name='Hit Frames', value=hit_frames)
        if reaction_data:
            embed.add_field(name='Hit Reactions', value=reaction_data)
        if hits > 1:
            embed.add_field(name='Damage Distribution', value=ratios)

        await ctx.send(embed=embed)

    @xc2special.command(name='all')
    async def xc2special_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 specials."""

        await utils.all_entries(ctx, 'xeno2', 'specials')

    @xc2special.command(name='search')
    async def xc2special_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 special."""

        await utils.search_entries(ctx, 'xeno2', name, 'specials', type_name='Special')

    @xc2special.error
    @xc2special_search.error
    async def xc2special_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing special name.')

    @utils.group(invoke_without_command=True)
    async def xc2blade(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 blade."""

        query = """
                WITH battle_skills AS (
                    SELECT
                        blade,
                        STRING_AGG(skill, E'\n') AS battle_skills
                    FROM xeno2.blade_battle_skills
                    GROUP BY blade
                ), field_skills AS (
                    SELECT
                        blade,
                        STRING_AGG(skill, E'\n') AS field_skills
                    FROM xeno2.blade_field_skills
                    GROUP BY blade
                ), favorite_items AS (
                    SELECT
                        blade,
                        STRING_AGG(name, E'\n') AS favorite_items
                    FROM xeno2.blade_favorite_pouch_items
                    JOIN xeno2.pouch_items
                    ON pouch_item=id
                    GROUP BY blade
                ), favorite_categories AS (
                    SELECT
                        blade,
                        STRING_AGG(pouch_category, E'\n') AS favorite_categories
                    FROM xeno2.blade_favorite_pouch_categories
                    GROUP BY blade
                ), blade_arts AS (
                    SELECT
                        blade,
                        STRING_AGG(blade_art, E'\n') AS blade_arts
                    FROM xeno2.blade_blade_arts
                    GROUP BY blade
                ), blade_specials AS (
                    SELECT
                        blade,
                        STRING_AGG(level || ': ' || special, E'\n' ORDER BY level) AS specials
                    FROM xeno2.blade_specials
                    GROUP BY blade
                )
                SELECT
                    blades.name,
                    gender,
                    race,
                    weapon,
                    element,
                    aux_cores,
                    phys_def,
                    ether_def,
                    voice_actor,
                    illustrator,
                    merc_name,
                    specials,
                    battle_skills,
                    field_skills,
                    favorite_items,
                    favorite_categories,
                    blade_arts,
                    CASE WHEN stat IS NOT NULL
                         THEN '+' || mod || '%' || ' ' || stat
                         ELSE NULL
                    END AS stat_mod
                FROM xeno2.blades
                JOIN blade_specials
                ON name=blade_specials.blade
                JOIN battle_skills
                ON name=battle_skills.blade
                LEFT JOIN field_skills
                ON name=field_skills.blade
                LEFT JOIN favorite_items
                ON name=favorite_items.blade
                LEFT JOIN favorite_categories
                ON name=favorite_categories.blade
                LEFT JOIN blade_arts
                ON name=blade_arts.blade
                LEFT JOIN xeno2.blade_stat_mods
                ON name=blade_stat_mods.blade
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2blade_search, name=name)

        name, gender, race, weapon, element, aux_cores, phys_def, ether_def, voice_actor, illustrator, merc_name, blade_specials, battle_skills, field_skills, favorite_items, favorite_categories, blade_arts, stat_mod = record

        embed = discord.Embed(title=name)

        embed.add_field(name='Gender', value=gender)
        embed.add_field(name='Race', value=race)
        embed.add_field(name='Weapon', value=weapon)
        embed.add_field(name='Element', value=element)
        embed.add_field(name='Aux Core Slots', value=aux_cores)
        embed.add_field(name='Stat Mod', value=stat_mod)
        embed.add_field(name='Defenses', value=f'Physical Defense: {phys_def}%\nEther Defense: {ether_def}%', inline=False)
        embed.add_field(name='Specials', value=blade_specials)
        embed.add_field(name='Battle Skills', value=battle_skills)
        embed.add_field(name='Field Skills', value=field_skills)
        embed.add_field(name='Blade Arts', value=blade_arts)
        embed.add_field(name='Favorite Pouch Items', value=favorite_items)
        embed.add_field(name='Favorite Pouch Categories', value=favorite_categories)
        embed.add_field(name='Voice Actors', value=voice_actor)
        embed.add_field(name='Illustrator', value=illustrator)
        embed.add_field(name='Mercenary Name', value=merc_name)

        await ctx.send(embed=embed)

    @xc2blade.command(name='all')
    async def xc2blade_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 blades."""

        await utils.all_entries(ctx, 'xeno2', 'blades')

    @xc2blade.command(name='search')
    async def xc2blade_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 blade."""

        await utils.search_entries(ctx, 'xeno2', name, 'blades', type_name='Blade')

    @xc2blade.error
    @xc2blade_search.error
    async def xc2blade_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing blade name.')

    @utils.group(invoke_without_command=True)
    async def xc2skill(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 skill."""

        query = """
                (
                    SELECT
                        'driver skill' AS type,
                        name,
                        xeno2.format_caption(enhance_captions.caption, param, param_one, param_two),
                        driver,
                        chart,
                        sp,
                        0
                    FROM xeno2.skills
                    JOIN xeno2.enhance
                    ON skills.caption=enhance.id
                    JOIN xeno2.enhance_captions
                    ON enhance.caption=enhance_captions.id
                    WHERE LOWER(name)=$1
                )
                UNION
                (
                    SELECT
                        'blade battle skill' AS type,
                        captions.skill,
                        caption,
                        STRING_AGG(role, E'\n'),
                        STRING_AGG(blade, E'\n'),
                        0,
                        0
                    FROM (
                        SELECT
                            skill,
                            xeno2.format_caption(
                                enhance_captions.caption,
                                param,
                                '[' || STRING_AGG(param_one::float::text, '/' ORDER BY level) || ']',
                                '[' || STRING_AGG(param_two::float::text, '/' ORDER BY level) || ']'
                            ) AS caption
                        FROM xeno2.blade_skill_enhance AS skills
                        JOIN xeno2.enhance
                        ON skills.caption=enhance.id
                        JOIN xeno2.enhance_captions
                        ON enhance.caption=enhance_captions.id
                        WHERE LOWER(skill)=$1
                        GROUP BY skill, enhance_captions.caption, param
                    ) AS captions
                    LEFT JOIN xeno2.blade_battle_skills
                    ON captions.skill=blade_battle_skills.skill
                    LEFT JOIN xeno2.common_blade_battle_skills AS common
                    ON captions.skill=common.skill
                    GROUP BY captions.skill, caption
                )
                UNION
                (
                    SELECT
                        'blade field skill' AS type,
                        name,
                        caption,
                        category,
                        STRING_AGG(blade, E'\n'),
                        min_level,
                        max_level
                    FROM xeno2.field_skills
                    LEFT JOIN xeno2.blade_field_skills
                    ON name=skill
                    WHERE LOWER(name)=$1
                    GROUP BY name
                );
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2skill_search, name=name)

        skill_type, name, caption, *_ = record

        embed = discord.Embed(title=name, description=caption)

        if skill_type == 'driver skill':
            driver, chart, sp, max_level = _

            embed.add_field(name='Driver', value=driver)
            embed.add_field(name='Chart', value=chart)
            embed.add_field(name='SP Needed', value=sp)
        elif skill_type == 'blade battle skill':
            roles, blades, *_ = _

            if roles:
                embed.add_field(name='Roles', value=roles)
            elif blades:
                embed.add_field(name='Blade', value=blades)
        elif skill_type == 'blade field skill':
            category, blades, min_level, max_level = _

            embed.add_field(name='Category', value=category)
            embed.add_field(name='Min Level', value=min_level)
            embed.add_field(name='Max Level', value=max_level)
            if blades:
                embed.add_field(name='Blade', value=blades)

        await ctx.send(embed=embed)

    @xc2skill.command(name='all', ignore_extra=False)
    async def xc2skill_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 skills."""

        await utils.all_entries(ctx, 'xeno2', 'skills', 'battle_skills', 'field_skills')

    @xc2skill.command(name='search')
    async def xc2skill_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 skill."""

        await utils.search_entries(ctx, 'xeno2', name, 'skills', 'battle_skills', 'field_skills', type_name='Skill')

    @xc2skill.error
    @xc2skill_search.error
    @xc2skill_all.error
    async def xc2skill_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing skill name.')
        elif isinstance(error, commands.TooManyArguments):
            await ctx.invoke(self.xc2skill, name=ctx.message.content[len(ctx.prefix) + 9:])

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
                    xeno2.format_caption(enhance_captions.caption, param, param_one, param_two),
                    chip,
                    weapon_filenames.filename
                FROM xeno2.weapons
                LEFT JOIN xeno2.chip_weapons
                ON name=weapon
                LEFT JOIN xeno2.enhance
                ON weapons.caption=enhance.id
                LEFT JOIN xeno2.enhance_captions
                ON enhance.caption=enhance_captions.id
                LEFT JOIN xeno2.weapon_filenames
                ON weapons.filename=weapon_filenames.id
                WHERE LOWER(name)=$1
                OR LOWER(type || ' ' || REPLACE(chip, ' Chip', '')) = $1;
                """

        record = await ctx.pool.fetchrow(query, name.lower().replace(' chip', ''))

        if record is None:
            return await ctx.invoke(self.xc2weapon_search, name=name)

        name, weapon_type, rank, damage, stability, crit_rate, block_rate, effect, chip, filename = record

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

        if filename:
            embed.set_thumbnail(url='attachment://weapon.png')
            return await ctx.send(embed=embed, file=discord.File(f'xeno2/weapons/{filename}_0.png', 'weapon.png'))

        await ctx.send(embed=embed)

    @xc2weapon.command(name='icon')
    async def xc2weapon_icon(self, ctx: utils.Context, *, name: str):
        """Posts the icon for a Xenoblade Chronicles 2 weapon."""

        query = """
                SELECT
                    name,
                    weapon_filenames.filename
                FROM xeno2.weapons
                LEFT JOIN xeno2.chip_weapons
                ON name=weapon
                LEFT JOIN xeno2.weapon_filenames
                ON weapons.filename=weapon_filenames.id
                WHERE LOWER(name)=$1
                OR LOWER(type || ' ' || REPLACE(chip, ' Chip', '')) = $1;
                """

        record = await ctx.pool.fetchrow(query, name.lower().replace(' chip', ''))

        if record is None:
            return await ctx.invoke(self.xc2weapon_search, name=name)

        name, filename = record

        if filename is None:
            return await ctx.send('Weapon does not have an icon.')

        await ctx.send(file=discord.File(f'xeno2/weapons/{filename}_0.png', f'{name}.png'))

    @xc2weapon.command(name='all', ignore_extra=False)
    async def xc2weapon_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 weapons."""

        await utils.all_entries(ctx, 'xeno2', 'weapons')

    @xc2weapon.command(name='search')
    async def xc2weapon_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 weapon."""

        await utils.search_entries(ctx, 'xeno2', name, 'weapons', type_name='Weapon')

    @xc2weapon.error
    @xc2weapon_all.error
    @xc2weapon_search.error
    async def xc2weapon_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing weapon name.')
        elif isinstance(error, commands.TooManyArguments):
            await ctx.invoke(self.xc2weapon, name=ctx.message.content[len(ctx.prefix) + 10:])

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
            return await ctx.invoke(self.xc2chip_search, name=name)

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

        await utils.all_entries(ctx, 'xeno2', 'chips')

    @xc2chip.command(name='search')
    async def xc2chip_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 core chip."""

        await utils.search_entries(ctx, 'xeno2', name, 'chips', type_name='Chip')

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
                    xeno2.format_caption(enhance_captions.caption, param, param_one, param_two),
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
                JOIN xeno2.enhance
                ON cores.caption=enhance.id
                JOIN xeno2.enhance_captions
                ON enhance.caption=enhance_captions.id
                WHERE LOWER(name)=$1
                GROUP BY name, enhance_captions.caption, param, param_one, param_two
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2core_search, name=name)

        name, effect, sell_price, rarity, materials = record

        embed = discord.Embed(title=name, description=effect)
        embed.add_field(name='Rarity', value=rarity)
        embed.add_field(name='Sell Price', value=sell_price)
        embed.add_field(name='Refining Materials', value=materials)

        await ctx.send(embed=embed)

    @xc2core.command(name='all')
    async def xc2core_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 aux cores."""

        await utils.all_entries(ctx, 'xeno2', 'cores')

    @xc2core.command(name='search')
    async def xc2core_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 aux core."""

        await utils.search_entries(ctx, 'xeno2', name, 'cores', type_name='Core')

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
             return await ctx.invoke(self.xc2accessory_search, name=name)

        embed = discord.Embed(title=records[0]['name'])

        for row in records:
            embed.add_field(name=row['rarity'], value=row['caption'], inline=False)

        await ctx.send(embed=embed)

    @xc2accessory.command(name='all')
    async def xc2accessory_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 accessories."""

        await utils.all_entries(ctx, 'xeno2', 'accessories')

    @xc2accessory.command(name='search')
    async def xc2accessory_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 accessory."""

        await utils.search_entries(ctx, 'xeno2', name, 'accessories', type_name='Accessory')

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
                    STRING_AGG(DISTINCT xeno2.format_caption(pouch_captions.caption, param), E'\n') AS effects,
                    STRING_AGG(DISTINCT blade, E'\n') AS blades
                FROM xeno2.pouch_items
                JOIN xeno2.pouch_item_effects
                ON name=pouch_item_effects.pouch_item
                JOIN xeno2.pouch_captions
                ON pouch_captions.id=pouch_item_effects.caption
                LEFT JOIN xeno2.blade_favorite_pouch_items
                ON pouch_items.id=blade_favorite_pouch_items.pouch_item
                WHERE LOWER(name)=$1
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
            return await ctx.invoke(self.xc2pouch_search, name=name)

        name, category, sell_price, rarity, location, max_carry, time, trust, effects, blades = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Category', value=category)
        embed.add_field(name='Rarity', value=rarity)
        embed.add_field(name='Sell Price', value=sell_price)
        embed.add_field(name='Location', value=location)
        embed.add_field(name='Max Carry', value=max_carry)
        embed.add_field(name='Trust', value=trust)
        embed.add_field(name='Effect Time', value=f'{time} minutes')
        if blades:
            embed.add_field(name='Favorites', value=blades)
        embed.add_field(name='Effects', value=effects, inline=False)

        await ctx.send(embed=embed)

    @xc2pouch.command(name='all')
    async def xc2pouch_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 pouch items."""

        await utils.all_entries(ctx, 'xeno2', 'pouch_items')

    @xc2pouch.command(name='search')
    async def xc2pouch_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 pouch item."""

        await utils.search_entries(ctx, name, 'xeno2', 'pouch_items', type_name='Pouch item')

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
            return await ctx.invoke(self.xc2class_search, name=name)

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

        await utils.all_entries(ctx, 'xeno2', 'classes')

    @xc2class.command(name='search')
    async def xc2class_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 class."""

        await utils.search_entries(ctx, 'xeno2', name, 'classes', type_name='Class')

    @xc2class.error
    @xc2class_search.error
    async def xc2class_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing class name.')

    @utils.group(invoke_without_command=True)
    async def xc2collection(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade Chronicles 2 collection point."""

        query = """
                SELECT
                    name,
                    type,
                    CASE WHEN min != max
                         THEN min || '-' || max
                         ELSE min::text
                    END AS amount,
                    STRING_AGG(item || ': ' || prob || '%', E'\n') AS items
                FROM (
                    SELECT collection_point, item, SUM(probability) AS prob
                    FROM xeno2.collection_point_drops
                    WHERE collection_point=$1
                    GROUP BY collection_point, item
                    ORDER BY prob DESC
                ) AS drops
                JOIN xeno2.collection_points
                ON collection_point=name
                GROUP BY name;
                """

        record = await ctx.pool.fetchrow(query, name.lower())

        if record is None:
             return await ctx.invoke(self.xc2collection_search, name=name)

        name, field_skill, amount, items = record

        embed = discord.Embed(title=name)
        embed.add_field(name='Field Skill', value=field_skill)
        embed.add_field(name='Amount', value=amount)
        embed.add_field(name='Items', value=items)

        await ctx.send(embed=embed)

    @xc2collection.command(name='all')
    async def xc2collection_all(self, ctx: utils.Context):
        """Lists all Xenoblade Chronicles 2 collection points."""

        await utils.all_entries(ctx, 'xeno2', 'collection_points')

    @xc2collection.command(name='search')
    async def xc2collection_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles 2 collection point."""

        await utils.search_entries(ctx, 'xeno2', name, 'collection_points', type_name='Collection point')

    @xc2collection.error
    @xc2collection_search.error
    async def xc2collection_error(self, ctx: utils.Context, error: Exception):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing collection point name.')

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

    @commands.command()
    async def say(self, ctx: utils.Context):
        """Says a random Poppi quote."""

        query = """SELECT quote FROM poppi_quotes ORDER BY RANDOM() LIMIT 1;"""

        await ctx.send(await ctx.pool.fetchval(query))


def setup(bot: Bot):
    bot.add_cog(Xenoblade2())
