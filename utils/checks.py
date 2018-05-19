import discord
from discord.ext import commands


__all__ = ('MissingPerms', 'StarError', 'role_or_permissions', 'mod_or_permissions', 'requires_starboard')


class MissingPerms(commands.MissingPermissions):
    def __init__(self, *roles, **perms):
        stuffs = []
        stuffs.append('Missing required permissions to run this command.')

        if roles and perms:
            stuffs.append('You need either a role with one of these names:')
        elif roles:
            stuffs.append('You need a role with one of these names:')
        elif perms:
            stuffs.append('You need one of the following permissions:')

        if roles:
            stuffs.append('\n'.join(f'- {role}' for role in roles))

        if perms:
            if roles:
                stuffs.append('\nOr one of these permissions:')

            perms = [perm.replace('_', ' ').replace('guild', 'server').title() for perm in perms]
            stuffs.append('\n'.join(f'- {perm}' for perm in perms))

        Exception.__init__(self, '\n'.join(stuffs))


class StarError(commands.CheckFailure):
    pass


def role_or_permissions(ctx, *roles, **perms):
    if not isinstance(ctx.channel, discord.abc.GuildChannel):
        raise commands.NoPrivateMessage

    if ctx.author == ctx.bot.owner:
        return True

    role = discord.utils.find(lambda r: r.name in roles, ctx.author.roles)
    if role:
        return True

    resolved = ctx.channel.permissions_for(ctx.author)
    missing = [name for name, value in perms.items() if getattr(resolved, name, None) != value]
    if not missing:
        return True

    raise MissingPerms(*roles, **perms)


def mod_or_permissions(**perms):
    perms['manage_guild'] = True
    def predicate(ctx):
        return role_or_permissions(ctx, 'Mod', 'Admin', **perms)

    return commands.check(predicate)


def requires_starboard():
    async def predicate(ctx):
        if ctx.guild is None:
            return False

        query = "SELECT 1 FROM starboards WHERE guild_id=$1;"
        exists = await ctx.pool.fetchval(query, ctx.guild.id)

        if exists is None:
            raise StarError('Starboard not found.')

        return True

    return commands.check(predicate)
