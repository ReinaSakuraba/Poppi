import discord
from discord.ext import commands

import utils


class Stats:
    @utils.group(invoke_without_command=True)
    async def stats(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        embed = discord.Embed(title='Command Stats', color=member.color)
        embed.set_author(name=member, icon_url=member.avatar_url)

        query = 'SELECT COUNT(*) FROM commands WHERE guild_id=$1 AND author_id=$2;'
        count = await ctx.pool.fetchval(query, ctx.guild.id, member.id)

        embed.description = f'{count} commands used'

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                AND author_id=$2
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id, member.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Most Used Commands', value=value or 'No Commands', inline=False)

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                AND author_id=$2
                and used > (CURRENT_TIMESTAMP - INTERVAL '1 day')
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id, member.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Most Used Commands Today', value=value or 'No Commands', inline=False)

        await ctx.send(embed=embed)

    @stats.command(name='global')
    async def stats_global(self, ctx, *, member: discord.Member = None):
        member = member or ctx.author

        embed = discord.Embed(title='Global Command Stats', color=member.color)
        embed.set_author(name=member, icon_url=member.avatar_url)

        query = 'SELECT COUNT(*) FROM commands WHERE author_id=$1;'
        count = await ctx.pool.fetchval(query, member.id)

        embed.description = f'{count} commands used'

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE author_id=$1
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, member.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Most Used Commands', value=value or 'No Commands', inline=False)

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE author_id=$1
                and used > (CURRENT_TIMESTAMP - INTERVAL '1 day')
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, member.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Most Used Commands Today', value=value or 'No Commands', inline=False)

        await ctx.send(embed=embed)

    @stats.command(name='server')
    @commands.guild_only()
    async def stats_server(self, ctx):
        embed = discord.Embed(title='Server Command Stats')

        query = 'SELECT COUNT(*) FROM commands WHERE guild_id=$1;'
        count = await ctx.pool.fetchval(query, ctx.guild.id)

        embed.description = f'{count} commands used'

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Commands', value=value or 'No Commands', inline=False)

        query = """
                SELECT command, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                and used > (CURRENT_TIMESTAMP - INTERVAL '1 day')
                GROUP BY command
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: {command} ({uses} uses)' for (index, (command, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Commands Today', value=value or 'No Commands', inline=False)

        query = """
                SELECT author_id, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                GROUP BY author_id
                ORDER BY uses DESC
                LIMIT 5;
                """

        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: <@!{author_id}> ({uses} uses)'
                          for (index, (author_id, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Command Users', value=value or 'No Commands', inline=False)

        query = """
                SELECT author_id, COUNT(*) AS uses
                FROM commands
                WHERE guild_id=$1
                AND used > (CURRENT_TIMESTAMP - INTERVAL '1 day')
                GROUP BY author_id
                ORDER BY uses DESC
                LIMIT 5;
                """

        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: <@!{author_id}> ({uses} uses)'
                          for (index, (author_id, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Command Users Today', value=value or 'No Commands', inline=False)

        await ctx.send(embed=embed)


def setup(bot):
    bot.add_cog(Stats())
