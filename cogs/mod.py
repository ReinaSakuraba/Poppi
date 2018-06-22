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
            is_ignored = await self.is_ignored(ctx.pool, ctx.guild.id, ctx.channel.id)
            return not is_plonked and not is_ignored
        return True

    async def is_plonked(self, pool, user_id, guild_id=0):
        query = f'SELECT 1 FROM plonks WHERE author_id=$1 AND guild_id=$2;'
        is_plonked = await pool.fetchval(query, user_id, guild_id)

        return is_plonked

    async def get_plonks(self, pool, guild_id=0):
        query = f'SELECT ARRAY(SELECT author_id FROM plonks WHERE guild_id=$1);'
        plonks = await pool.fetchval(query, guild_id)

        return plonks

    async def is_ignored(self, pool, guild_id, channel_id):
        query = f'SELECT 1 FROM ignores WHERE guild_id=$1 AND channel_id=$2;'
        is_ignored = await pool.fetchval(query, guild_id, channel_id)

        return is_ignored

    async def get_ignores(self, pool, guild_id):
        query = f'SELECT ARRAY(SELECT channel_id FROM ignores WHERE guild_id=$1);'
        ignores = await pool.fetchval(query, guild_id)

        return ignores

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

    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions(manage_channels=True)
    async def ignore(self, ctx):
        """Handles the bot's ignore lists.

        To use these commands you must have the Mod role or have the
        Manage Channels permissions. These commands are not allowed
        to be used in a private message context. Users with Manage
        Guild or Mod role can still invoke the bot in ignored channels.
        """
        pass

    @ignore.command(name='channel')
    @utils.mod_or_permissions(manage_channels=True)
    async def ignore_channel(self, ctx, *, channel: discord.TextChannel = None):
        """Ignores a specific channel from being processed.

        If no channel is specified, the current channel is ignored. If a
        channel is ignored then the bot does not process commands in that
        channel until it is unignored.
        """

        channel = channel or ctx.channel

        query = """
                INSERT INTO ignores (
                    guild_id,
                    channel_id
                ) VALUES ($1, $2);
                """
        try:
            await ctx.pool.execute(query, ctx.guild.id, channel.id)
        except asyncpg.UniqueViolationError:
            return await ctx.send('This channel is already being ignored in this server.')

        await ctx.send(f'{channel.name} is now being ignored in this server.')

    @ignore.command(name='all')
    @utils.mod_or_permissions(manage_channels=True)
    async def ignore_all(self, ctx):
        """Ignores all channels in this server from being processed."""

        query = """
                INSERT INTO ignores (
                    guild_id,
                    channel_id
                ) VALUES ($1, $2)
                ON CONFLICT (guild_id, channel_id)
                DO NOTHING;
                """

        for channel in ctx.guild.text_channels:
            await ctx.pool.execute(query, ctx.guild.id, channel.id)

        await ctx.send('All channels are now being ignored.')

    @ignore.command(name='list')
    @utils.mod_or_permissions(manage_channels=True)
    async def ignore_list(self, ctx):
        """Tells you what channels are currently ignored in this server."""

        ignores = await self.get_ignores(ctx.pool, ctx.guild.id)

        channels = ' '.join(f'<#{channel_id}>' for channel_id in ignores)


        if not channels:
            return await ctx.send('No channels are being ignored in this server.')

        await ctx.send(f'The following channels are being ignored in this server: {channels}')


    @utils.group(invoke_without_command=True)
    @utils.mod_or_permissions(manage_channels=True)
    async def unignore(self, ctx, *, channel: discord.TextChannel = None):
        """Unignores a channel from being processed.

        If no channel is specified, it unignores the current channel.

        To use this command you must have tha Manage Channels permission
        or have the Mod role.
        """

        channel = channel or ctx.channel

        query = "DELETE FROM ignores WHERE channel_id=$1 RETURNING 1;"

        was_ignored = await ctx.pool.fetchval(query, channel.id)

        if not was_ignored:
            return await ctx.send('This channel is not being ignored in this server.')

        await ctx.send(f'{channel.name} is now being unignored in this server.')

    @unignore.command(name='all')
    @utils.mod_or_permissions(manage_channels=True)
    async def unignore_all(self, ctx):
        """Unignores all channels in this server from being processed."""

        query = "DELETE FROM ignores WHERE guild_id=$1;"

        await ctx.pool.execute(query, ctx.guild.id)

        await ctx.send('All channels are now being unignored.')


def setup(bot):
    bot.add_cog(Mod())
