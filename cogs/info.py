import os
import inspect
import pkg_resources

import discord
from discord.ext import commands

import utils


class Info:
    """Commands that tell you info about the bot."""

    @commands.command()
    async def about(self, ctx):
        """Tells you information about the bot itself."""

        query = 'SELECT COUNT(*) FROM commands WHERE used > $1;'
        commands_used = await ctx.pool.fetchval(query, ctx.bot.start_time)
        version = pkg_resources.get_distribution('discord.py')
        recent_changes, _ = await self.get_recent_changes(limit=3)

        embed = discord.Embed(timestamp=ctx.bot.start_time)
        embed.set_author(name=ctx.bot.owner, icon_url=ctx.bot.owner.avatar_url)
        embed.add_field(name='Uptime', value=ctx.bot.uptime, inline=False)
        embed.add_field(name='Users', value=len(ctx.bot.users))
        embed.add_field(name='Servers', value=len(ctx.bot.guilds))
        embed.add_field(name='Channels', value=sum(1 for c in ctx.bot.get_all_channels()))
        embed.add_field(name='Commands Run', value=commands_used)
        embed.add_field(name='Memory Usage', value=ctx.bot.memory_usage)
        embed.add_field(name='CPU Usage', value=ctx.bot.cpu_usage)
        embed.add_field(name='Recent Changes', value=recent_changes, inline=False)
        embed.set_footer(text=f'Made with {version}', icon_url='http://i.imgur.com/5BFecvA.png')

        await ctx.send(embed=embed)

    @commands.command()
    async def invite(self, ctx):
        """Posts the bot's invite link."""

        app_info = await ctx.bot.application_info()

        permissions = discord.Permissions()
        permissions.read_messages = True
        permissions.send_messages = True
        permissions.manage_messages = True
        permissions.add_reactions = True
        permissions.embed_links = True
        permissions.read_message_history = True

        invite = discord.utils.oauth_url(app_info.id, permissions=permissions)
        await ctx.send(invite)

    @commands.command()
    async def uptime(self, ctx):
        """Posts the bot's uptime."""

        await ctx.send(f'Uptime: **{ctx.bot.uptime}**')

    @commands.command()
    async def memory(self, ctx):
        """Posts the bot's uptime."""

        await ctx.send(f'Memory Usage: **{ctx.bot.memory_usage}**')

    @commands.command()
    async def cpu(self, ctx):
        """Posts the bot's uptime."""

        await ctx.send(f'CPU Usage: **{ctx.bot.cpu_usage}**')

    @commands.command(aliases=['github'])
    async def source(self, ctx, *, command: utils.CommandConverter = None):
        """Posts the source code for the bot."""

        source_url = await self.get_github_url()

        if command is None:
            return await ctx.send(source_url)

        src = getattr(command, 'callback', command.__class__)

        lines, first_line = inspect.getsourcelines(src)
        last_line = first_line + len(lines) - 1
        module = src.__module__
        if not module.startswith('discord'):
            location = os.path.relpath(inspect.getfile(src))
            branch, _ = await utils.run_subprocess('git rev-parse HEAD')
            branch = branch.strip()
        else:
            location = f'{module.replace(".", "/")}.py'
            source_url = 'https://github.com/Rapptz/discord.py'
            branch = 'rewrite'

        final_url = f'{source_url}/blob/{branch}/{location}#L{first_line}-L{last_line}'
        await ctx.send(final_url)

    @commands.command()
    async def changelog(self, ctx):
        """Shows recent changes made to the bot."""

        changes, _ = await self.get_recent_changes()

        try:
            paginator = utils.EmbedPaginator(ctx, entries=changes.split('\n'))
            paginator.embed.title = 'Change Log'
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    async def get_github_url(self):
        result = await utils.run_subprocess('git remote get-url origin')
        return result[0].strip()[:-4]

    async def get_recent_changes(self, *, limit=None):
        url = await self.get_github_url()
        cmd = f'git log --pretty=format:"[%s]({url}/commit/%H) (%cr)"'
        if limit is not None:
            cmd += f' -{limit}'

        result = await utils.run_subprocess(cmd)
        return result


def setup(bot):
    bot.add_cog(Info())
