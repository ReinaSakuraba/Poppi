import discord
from discord.ext import commands

import utils


def valid_prefix(argument):
    if not argument:
        raise commands.BadArgument('Custom prefix cannot be empty.')
    elif argument.startswith(' '):
        raise commands.BadArgument('Custom prefix cannot start with a space.')
    elif len(argument) > 32:
        raise commands.BadArgument('Custom prefix cannot have over 32 characters.')

    return argument


class Prefix:
    """Commands used to manage custom prefixes."""

    def __local_check(self, ctx):
        if not ctx.guild:
            raise commands.NoPrivateMessage()
        return True

    async def __error(self, ctx, exception):
        if isinstance(exception, commands.BadArgument):
            await ctx.send(exception)

    @utils.group(invoke_without_command=True, aliases=['prefixes'])
    async def prefix(self, ctx):
        """Manages the server's custom prefixes.

        If called without a subcommand, this will list the currently set
        prefixes.
        """

        prefixes = [ctx.me.mention]
        prefixes.extend(ctx.bot.command_prefix(ctx.bot, ctx.message, mentions=False))

        embed = discord.Embed(title='Prefixes')
        embed.description = '\n'.join(f'{index}. {value}' for index, value in enumerate(prefixes, 1))
        embed.set_footer(text=utils.plural('prefix', len(prefixes), ending='es'))
        await ctx.send(embed=embed)

    @prefix.command(name='add', ignore_extra=False)
    @utils.mod_or_permissions()
    async def prefix_add(self, ctx, prefix: valid_prefix):
        """Adds a prefix to the list of custom prefixes.

        Previously set prefixes are not overridden.

        To have a word prefix, you should quote it and end it with
        a space, e.g. "hello " to set the prefix to "hello ". This
        is because Discord removes spaces when sending messages so
        the spaces are not preserved.

        Multi-word prefixes must be quoted also.

        You must have Manage Server permissions to run this command.
        """

        prefixes = ctx.bot.command_prefix(ctx.bot, ctx.message, mentions=False)
        prefixes.append(prefix)
        try:
            await ctx.bot.set_prefixes(ctx.guild.id, prefixes)
        except RuntimeError as e:
            return await ctx.send(e)

        await ctx.send(f'Prefix "{prefix}" added.')

    @prefix.command(name='remove', ignore_extra=True)
    @utils.mod_or_permissions()
    async def prefix_remove(self, ctx, prefix: valid_prefix):
        """Removes a prefix from the list of custom prefixes.

        This is the inverse of the 'prefix add' command. You can
        use this to remove prefixes from the default set as well.

        You must have Manage Server permissions to run this command.
        """

        prefixes = ctx.bot.command_prefix(ctx.bot, ctx.message, mentions=False)
        try:
            prefixes.remove(prefix)
        except ValueError:
            return await ctx.send(f'Prefix "{prefix}" does not exist.')

        await ctx.bot.set_prefixes(ctx.guild.id, prefixes)
        await ctx.send(f'Prefix "{prefix}" removed.')

    @prefix_add.error
    @prefix_remove.error
    async def prefix_error(self, ctx, exception):
        if isinstance(exception, commands.TooManyArguments):
            await ctx.send('You must wrap the prefix in quotes.')

    @prefix.command(name='reset')
    @utils.mod_or_permissions()
    async def prefix_reset(self, ctx):
        """Resets the custom prefixes.

        After this, the bot will only listen to mention prefixes and &.

        You must have Manage Server permissions to use this command.
        """

        try:
            await ctx.bot.prefixes.remove(ctx.guild.id)
        except KeyError:
            return await ctx.send('Prefixes are already the default.')

        await ctx.send('Prefixes have been reset.')

    @prefix.command(name='clear')
    @utils.mod_or_permissions()
    async def prefix_clear(self, ctx):
        """Removes all custom prefixes.

        After this, the bot will only listen to mention prefixes.

        You must have Manage Server permissions to use this command.
        """

        await ctx.bot.set_prefixes(ctx.guild.id, [])
        await ctx.send('All prefixes have been removed.')


def setup(bot):
    bot.add_cog(Prefix())
