import pkg_resources

import discord
from discord.ext import commands


class Info:
    """Commands that tell you info about the bot."""

    @commands.command()
    async def about(self, ctx):
        """Tells you information about the bot itself."""

        query = 'SELECT COUNT(*) FROM commands WHERE used > $1;'
        commands_used = await ctx.pool.fetchval(query, ctx.bot.start_time)
        version = pkg_resources.get_distribution('discord.py')

        embed = discord.Embed(timestamp=ctx.bot.start_time)
        embed.set_author(name=ctx.bot.owner, icon_url=ctx.bot.owner.avatar_url)
        embed.add_field(name='Uptime', value=ctx.bot.uptime, inline=False)
        embed.add_field(name='Users', value=len(ctx.bot.users))
        embed.add_field(name='Servers', value=len(ctx.bot.guilds))
        embed.add_field(name='Channels', value=sum(1 for c in ctx.bot.get_all_channels()))
        embed.add_field(name='Commands Run', value=commands_used)
        embed.add_field(name='Memory Usage', value=ctx.bot.memory_usage)
        embed.add_field(name='CPU Usage', value=ctx.bot.cpu_usage)
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


def setup(bot):
    bot.add_cog(Info())
