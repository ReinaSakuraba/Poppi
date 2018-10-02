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

        await utils.all_entries(ctx, 'xeno1', 'skills')

    @xc1skill.command(name='search')
    async def xc1skill_search(self, ctx: utils.Context, *, name: str):
        """Searches for a Xenoblade Chronicles skill."""

        await utils.search_entries(ctx, 'xeno1', name, 'skills', type_name='Skill')


def setup(bot):
    bot.add_cog(Xenoblade())
