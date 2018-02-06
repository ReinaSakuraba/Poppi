import asyncpg
import discord
from discord.ext import commands

import utils


class Mod:
    """Commands used for server moderation."""

    async def __global_check(self, ctx):
        if ctx.author == ctx.bot.owner:
            return True

        is_globally_plonked = await self.is_plonked(ctx.pool, ctx.author.id)

        if is_globally_plonked:
            return False

        perms = ctx.author.permissions_in(ctx.channel)
        if perms.manage_guild:
            return True

        if ctx.guild:
            is_plonked = await self.is_plonked(ctx.pool, ctx.author.id, ctx.guild.id)
            return not is_plonked
        return True

    async def is_plonked(self, pool, user_id, guild_id=0):
        query = f'SELECT 1 FROM plonks WHERE author_id=$1 AND guild_id=$2;'
        is_plonked = await pool.fetchval(query, user_id, guild_id)

        return is_plonked

    async def get_plonks(self, pool, guild_id=0):
        query = f'SELECT ARRAY(SELECT author_id FROM plonks WHERE guild_id=$1);'
        plonks = await pool.fetchval(query, guild_id)

        return plonks

    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions()
    async def plonks(self, ctx):
        """Shows users banned from the bot.

        You must have Manage Server permissions to run this command."""

        plonks = await self.get_plonks(ctx.pool, ctx.guild.id)

        members = ', '.join(map(str, filter(None, map(ctx.guild.get_member, plonks))))


        if not members:
            return await ctx.send('No members are bot banned in this server.')

        await ctx.send(f'The following members are bot banned in this server: {members}')

    @plonks.command(name='global')
    @commands.is_owner()
    async def plonks_global(self, ctx):
        """Shows users globally banned from the bot."""

        plonks = await self.get_plonks(ctx.pool)

        users = ', '.join(map(str, filter(None, map(ctx.bot.get_user, plonks))))

        if not users:
            return await ctx.send('No users are globally bot banned.')

        await ctx.send(f'The following members are globally bot banned: {users}')

    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions()
    async def plonk(self, ctx, *, member: discord.Member):
        """Bans a user from using the bot.

        This bans a person from using the bot in the current server.
        This ban can be bypassed by having the Manage Server permission.

        You must have Manage Server permissions to run this command.
        """

        query = """
                INSERT INTO plonks (
                    author_id,
                    guild_id
                ) VALUES ($1, $2);
                """
        try:
            await ctx.pool.execute(query, member.id, ctx.guild.id)
        except asyncpg.UniqueViolationError:
            return await ctx.send('This user is already bot banned in this server.')

        await ctx.send(f'{member.display_name} has been banned from using the bot in this server.')

    @plonk.group(name='global')
    @commands.is_owner()
    async def plonk_global(self, ctx, *, user: discord.User):
        """Globally bans a user from using the bot."""

        query = 'INSERT INTO plonks (author_id) VALUES ($1);'
        try:
            await ctx.pool.execute(query, user.id)
        except asyncpg.UniqueViolationError:
            return await ctx.send('This user is already globally bot banned.')

        await ctx.send(f'{user.display_name} has been globally bot banned.')

    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions()
    async def unplonk(self, ctx, *, member: discord.Member):
        """Unbans a user from using the bot.

        You must have Manage Server permissions to run this command.
        """

        query = 'DELETE FROM plonks WHERE author_id=$1 AND guild_id=$2 RETURNING 1;'
        was_plonked = await ctx.pool.fetchval(query, member.id, ctx.guild.id)

        if not was_plonked:
            return await ctx.send('This user is not bot banned in this server.')

        await ctx.send(f'{member.display_name} has been unbanned from using the bot in this server.')

    @unplonk.command(name='global')
    @commands.is_owner()
    async def unplonk_global(self, ctx, *, user: discord.User):
        """Globally unbans a user from using the bot."""

        query = 'DELETE FROM plonks WHERE author_id=$1 AND guild_id=0 RETURNING 1'
        was_globally_plonked = await ctx.pool.fetchval(query, user.id)

        if not was_globally_plonked:
            return await ctx.send('This user is not globally bot banned.')

        await ctx.send(f'{user.display_name} has been globally unbanned from using the bot.')


def setup(bot):
    bot.add_cog(Mod())
