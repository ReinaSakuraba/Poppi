import discord
from discord.ext import commands

import utils


class XC1Skill:
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

    @staticmethod
    def embed(record):
        name, description, shape, sp_cost, link_cost, effect = record

        embed = discord.Embed(title=name, description=description)
        embed.add_field(name='Effect', value=effect, inline=False)
        embed.add_field(name='Shape', value=shape)
        embed.add_field(name='SP Cost', value=sp_cost)
        embed.add_field(name='Link Cost', value=link_cost)

        return embed


class XCXSkill:
    query = """
            SELECT
                name,
                effect,
                STRING_AGG(class || ' ' || level, E'\n') AS learned
            FROM xenox.skills
            JOIN xenox.class_skills
            ON skills.name = class_skills.skill
            WHERE LOWER(name)=$1
            GROUP BY name;
            """

    @staticmethod
    def embed(record):
        name, effect, learned = record

        embed = discord.Embed(title=name, description=effect)
        embed.set_thumbnail(url='attachment://skill.png')
        embed.add_field(name='Learned', value=learned)

        return embed


class XC2Skill:
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

    @staticmethod
    def embed(record):
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

        return embed


class Xenoblade:
    @utils.group(aliases=['xc1skill', 'xcxskill', 'xc2skill'], invoke_without_command=True)
    async def skill(self, ctx: utils.Context, *, name: str):
        """Gives information for a Xenoblade skill."""

        view = commands.view.StringView(ctx.message.content)
        view.skip_string(ctx.prefix)

        invoked_with = commands.view.quoted_word(view).strip()

        thing = {
            'skill': (XC1Skill, XCXSkill, XC2Skill),
            'xc1skill': (XC1Skill,),
            'xcxskill': (XCXSkill,),
            'xc2skill': (XC2Skill,)
        }

        embeds = []

        for ass in thing[invoked_with.lower()]:
            record = await ctx.pool.fetchrow(ass.query, name.lower())
            if record:
                embeds.append(ass.embed(record))

        if len(embeds) == 0:
            return await ctx.invoke(self.skill_search, name=name)

        for embed in embeds:
            await ctx.send(embed=embed)

    @skill.command(name='all', ignore_extra=False)
    async def skill_all(self, ctx: utils.Context):
        """Gives all Xenoblade skills."""

        view = commands.view.StringView(ctx.message.content)
        view.skip_string(ctx.prefix)

        invoked_with = commands.view.quoted_word(view).strip()

        thing = {
            'skill': ('xeno1.skills', 'xenox.skills', 'xeno2.skills', 'xeno2.battle_skills', 'xeno2.field_skills'),
            'xc1skill': ('xeno1.skills',),
            'xcxskill': ('xenox.skills',),
            'xc2skill': ('xeno2.skills', 'xeno2.battle_skills', 'xeno2.field_skills')
        }

        await self.all_entries(ctx, *thing[invoked_with.lower()])

    @skill.command(name='search')
    async def skill_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade skill."""

        view = commands.view.StringView(ctx.message.content)
        view.skip_string(ctx.prefix)

        invoked_with = commands.view.quoted_word(view).strip()

        thing = {
            'skill': ('xeno1.skills', 'xenox.skills', 'xeno2.skills', 'xeno2.battle_skills', 'xeno2.field_skills'),
            'xc1skill': ('xeno1.skills',),
            'xcxskill': ('xenox.skills',),
            'xc2skill': ('xeno2.skills', 'xeno2.battle_skills', 'xeno2.field_skills')
        }

        await self.search_entries(ctx, name, *thing[invoked_with.lower()], type_name='Skill')

    @skill.error
    @skill_search.error
    @skill_all.error
    async def skill_error(self, ctx: utils.Context, exception: Exception):
        if isinstance(exception, commands.MissingRequiredArgument):
            await ctx.send('Missing skill name.')
        elif isinstance(exception, commands.TooManyArguments):
            view = commands.view.StringView(ctx.message.content)
            view.skip_string(ctx.prefix)

            invoked_with = commands.view.quoted_word(view)
            view.skip_ws()
            name = view.read_rest()

            await ctx.invoke(self.skill, name=name)

    async def search_entries(self, ctx: utils.Context, name: str, *table_names, type_name: str):
        base_query = """
                     SELECT name, SIMILARITY(name, $1)
                     FROM {0}
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
                     FROM {0}
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
