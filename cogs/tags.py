import re
import asyncio
from unittest.mock import Mock

import asyncpg
import discord
from discord.ext import commands

import utils
from .prefix import valid_prefix


class Tags:
    def __init__(self, bot):
        self.bot = bot
        self.pool = bot.pool
        self.config = utils.Config('tag_prefixes.json')

    async def __error(self, ctx, exception):
        if isinstance(exception, commands.UserInputError):
            if ctx.command.qualified_name == 'tag make':
                return
            await ctx.send(exception)

    async def get_tag(self, guild_id, name, *, pool):
        query = """
                SELECT id, content
                FROM tags
                WHERE location_id=$1
                AND LOWER(name)=$2;
                """
        row = await pool.fetchrow(query, guild_id, name.lower())

        if row is not None:
            return row

        query = """
                SELECT ARRAY(
                    SELECT name
                    FROM tags
                    WHERE location_id=$1
                    AND name % $2
                    ORDER BY SIMILARITY(name, $2) DESC
                );
                """
        possible_tags = await pool.fetchval(query, guild_id, name.lower())
        if not possible_tags:
            raise RuntimeError('Tag not found.')

        names = '\n'.join(possible_tags)
        raise RuntimeError(f'Tag not found. Did you mean...\n{names}')


    @utils.group(invoke_without_command=True)
    async def tag(self, ctx, *, tag: utils.TagName):
        """Allows you to tag text for later retrieval.

        If a subcommand is not called, then this will search the tag
        database for the tag requested.
        """

        try:
            row = await self.get_tag(ctx.guild.id, tag, pool=ctx.pool)
        except RuntimeError as e:
            return await ctx.send(e)

        await ctx.send(row['content'])

        query = 'UPDATE tags SET uses = uses + 1 WHERE id=$1'
        await ctx.pool.execute(query, row['id'])

    @tag.command(name='raw')
    async def tag_raw(self, ctx, *, tag: utils.TagName):
        """Gets the raw content of the tag.

        This is with markdown escaped. Useful for editing.
        """

        try:
            row = await self.get_tag(ctx.guild.id, tag, pool=ctx.pool)
        except RuntimeError as e:
            return await ctx.send(e)


        transformations = {
            re.escape(c): '\\' + c
            for c in ('*', '`', '_', '~', '\\', '<')
        }

        def replace(obj):
            return transformations.get(re.escape(obj.group(0)), '')

        pattern = re.compile('|'.join(transformations.keys()))
        await ctx.send(pattern.sub(replace, row['content']))

    @tag.command(name='create')
    async def tag_create(self, ctx, name: utils.TagName, *, content: commands.clean_content):
        """Creates a new tag owned by you.

        This tag is server-specific and cannot be used in other servers.
        Note that server moderators can delete your tag.
        """

        query = """
                INSERT INTO tags (
                    name,
                    content,
                    owner_id,
                    location_id
                ) VALUES ($1, $2, $3, $4);
                """

        try:
            await ctx.pool.execute(query, name, content, ctx.author.id, ctx.guild.id)
        except asyncpg.UniqueViolationError:
            await ctx.send('This tag already exists.')
        else:
            await ctx.send(f'Tag {name} succesfully created.')

    @tag.command(name='make', ignore_extra=False)
    async def tag_make(self, ctx):
        """Interactive makes a tag for you.

        This walks you through the process of creating a tag with
        its name and its content. This works similar to the tag
        create command.
        """

        await ctx.send('Hello. What would you like the tag name to be?')

        original = ctx.message

        try:
            name = await ctx.bot.wait_for('message', timeout=30.0, check=lambda msg: msg.author == ctx.author and ctx.channel == msg.channel and msg.content)
        except asyncio.TimeoutError:
            return await ctx.send('You took too long. Goodbye.')

        try:
            name = await utils.TagName().convert(ctx, name.content)
        except commands.BadArgument as e:
            return await ctx.send(f'{e}. Redo the command "{ctx.prefix}tag make" to retry.')

        query = 'SELECT 1 FROM tags WHERE location_id=$1 AND LOWER(name)=$2;'
        exists = await ctx.pool.fetchval(query, ctx.guild.id, name.lower())

        if exists:
            msg = f'Sorry. A tag with that name already exists. Redo the command "{ctx.prefix}tag make" to retry.'
            return await ctx.send(msg)

        await ctx.send(f'Neat. So the name is {name}. What about the tag\'s content?')

        try:
            msg = await ctx.bot.wait_for('message', check=lambda msg: msg.author == ctx.author and ctx.channel == msg.channel, timeout=300.0)
        except asyncio.TimeoutError:
            return await ctx.send('You took too long. Goodbye.')

        content = await commands.clean_content().convert(ctx, msg.content)

        if msg.attachments:
            content = f'{content}\n{msg.attachments[0].url}'

        await ctx.invoke(self.tag_create, name=name, content=content)

    @tag_make.error
    async def tag_make_error(self, ctx, exception):
        if isinstance(exception, commands.TooManyArguments):
            await ctx.send(f'Please call just {ctx.prefix}tag make.')

    @tag.command(name='remove', aliases=['delete'])
    async def tag_remove(self, ctx, *, name: utils.TagName):
        """Removes a tag that you own.

        The tag owner can always delete their own tags. If someone requests
        deletion and has Manage Server permissions then they can also
        delete it.
        """

        params = [name.lower(), ctx.guild.id]
        pred = ''

        try:
            utils.role_or_permissions(ctx, 'Admin', 'Mod', manage_messages=True)
        except utils.MissingPerms:
            params.append(ctx.author.id)
            pred = 'AND owner_id=$3'

        query = f"""
                DELETE FROM tags
                WHERE LOWER(name)=$1
                AND location_id=$2
                {pred}
                RETURNING 1;
                """

        deleted = await ctx.pool.fetchval(query, *params)

        if not deleted:
            return await ctx.send('Either this tag does not exist or you do not have permission to remove it.')

        await ctx.send('Tag successfully removed.')

    @tag.command(name='edit')
    async def tag_edit(self, ctx, name: utils.TagName, *, content: commands.clean_content):
        """Modifies an existing tag that you own.

        This command completely replaces the original text. If
        you want to get the old text back, consider using the
        tag raw command.
        """

        query = 'UPDATE tags SET content=$1 WHERE LOWER(name)=$2 AND location_id=$3 AND owner_id=$4 RETURNING 1;'
        status = await ctx.pool.fetchval(query, content, name.lower(), ctx.guild.id, ctx.author.id)

        if not status:
            return await ctx.send('Either this tag does not exist or you do not have permission to edit it.')

        await ctx.send('Tag successfully edited.')

    @tag.command(name='rename')
    async def tag_rename(self, ctx, name: utils.TagName, *, new_name: utils.TagName):
        """Renames an existing tag that you own.

        This command completely replaces the original name.
        """

        query = 'UPDATE tags SET name=$1 WHERE LOWER(name)=$2 AND location_id=$3 AND owner_id=$4 RETURNING 1;'
        try:
            status = await ctx.pool.fetchval(query, new_name, name.lower(), ctx.guild.id, ctx.author.id)
        except asyncpg.UniqueViolationError:
            return await ctx.send('A tag with that name already exists.')

        if not status:
            return await ctx.send('Either this tag does not exist or you do not have permission to rename it.')

        await ctx.send('Tag successfully renamed.')

    @tag.command(name='list')
    async def tag_list(self, ctx, *, member: discord.Member = None):
        """Lists all the tags that belong to you or someone else."""

        member = member or ctx.author
        query = 'SELECT name FROM tags WHERE location_id=$1 AND owner_id=$2 ORDER BY name;'
        records = await ctx.pool.fetch(query, ctx.guild.id, member.id)

        if records:
            entries = [f'{index}: {record[0]}' for index, record in enumerate(records, 1)]
            try:
                paginator = utils.EmbedPaginator(ctx, entries=entries)
                paginator.embed.set_author(name=member.display_name, icon_url=member.avatar_url)
                await paginator.paginate()
            except Exception as e:
                await ctx.send(e)
        else:
            await ctx.send(f'{member.display_name} has no tags.')

    @commands.command()
    async def tags(self, ctx, *, member: discord.Member = None):
        """An alias for the tag list command."""

        await ctx.invoke(self.tag_list, member=member)

    @tag.command(name='all')
    async def tag_all(self, ctx):
        """Lists all server-specific tags for this server."""

        query = 'SELECT name FROM tags WHERE location_id=$1 ORDER BY name;'
        records = await ctx.pool.fetch(query, ctx.guild.id)

        if records:
            entries = [f'{index}: {record[0]}' for index, record in enumerate(records, 1)]
            try:
                paginator = utils.EmbedPaginator(ctx, entries=entries)
                await paginator.paginate()
            except Exception as e:
                await ctx.send(e)
        else:
            await ctx.send('This server has no server-specific tags.')

    @tag.command(name='purge')
    @utils.mod_or_permissions(manage_messages=True)
    async def tag_purge(self, ctx, *, member: discord.Member):
        """Removes all server-specific tags by a user.

        You must have the Manage Messages permission to use this.
        """

        query = 'SELECT COUNT(*) FROM tags WHERE owner_id=$1 AND location_id=$2;'
        count = await ctx.pool.fetchval(query, member.id, ctx.guild.id)

        if count == 0:
            return await ctx.send(f'{member} does not have any tags to purge.')

        fmt = f'This will delete {count} tags are you sure? **This action cannot be reversed**.' \
              '\n\nReact with \N{WHITE HEAVY CHECK MARK} to confirm or \N{CROSS MARK} to deny.'
        msg = await ctx.send(fmt)
        for emoji in ('\N{WHITE HEAVY CHECK MARK}', '\N{CROSS MARK}'):
            await msg.add_reaction(emoji)

        def check(reaction, user):
            if reaction.message.id != msg.id:
                return False
            if user is None or user.id != ctx.author.id:
                return False

            return reaction.emoji in ('\N{WHITE HEAVY CHECK MARK}', '\N{CROSS MARK}')

        try:
            reaction, user = await ctx.bot.wait_for('reaction_add', check=check, timeout=60.0)
        except asyncio.TimeoutError:
            return await ctx.send('Cancelling tag purge request.')

        if reaction.emoji == '\N{CROSS MARK}':
            return await ctx.send('Cancelling tag purge request.')

        query = 'DELETE FROM tags WHERE owner_id=$1 AND location_id=$2;'
        await ctx.pool.execute(query, member.id, ctx.guild.id)
        await ctx.send(f'Successfully removed {count} tags that belong to {member}.')

    @tag.command(name='search', usage='<query>')
    async def tag_search(self, ctx, *, name: str):
        """Searches for a tag."""

        query = """
                SELECT name
                FROM tags
                WHERE location_id=$1 AND name % $2
                ORDER BY similarity(name, $2) DESC;
                """

        records = await ctx.pool.fetch(query, ctx.guild.id, name)

        if records:
            entries = [f'{index}: {record[0]}' for index, record in enumerate(records, 1)]
            try:
                paginator = utils.EmbedPaginator(ctx, entries=entries)
                await paginator.paginate()
            except Exception as e:
                await ctx.send(e)
        else:
            await ctx.send('No tags found.')

    @tag.command(name='random')
    async def tag_random(self, ctx, *, name: str = None):
        """Displays a random tag.

        A tag showing up in this does not get its usage count increased.
        """

        params = [ctx.guild.id]
        pred = ''
        if name:
            pred = 'AND LOWER(name) % $2'
            params.append(name.lower())

        query = f"""
                SELECT name, content
                FROM tags
                WHERE location_id=$1
                {pred}
                ORDER BY RANDOM()
                LIMIT 1;
                """
        row = await ctx.pool.fetchrow(query, *params)
        if row is None:
            return await ctx.send('No tags found.')

        await ctx.send(f'{row["name"]}: {row["content"]}')

    @tag.command(name='info')
    async def tag_info(self, ctx, *, tag: utils.TagName):
        """Retrieves info about a tag.

        The info includes things like the owner and how many times it was used.
        """

        query = """
                SELECT
                    *,
                    (
                        SELECT COUNT(*) + 1
                        FROM tags second
                        WHERE second.uses > first.uses
                        AND second.location_id = first.location_id
                    ) AS "server rank",
                    (
                        SELECT COUNT(*) + 1
                        FROM tags second
                        WHERE second.uses > first.uses
                    ) AS "global rank"
                FROM tags first
                WHERE location_id=$1
                AND LOWER(name)=$2;
                """
        row = await ctx.pool.fetchrow(query, ctx.guild.id, tag.lower())
        if row is None:
            return await ctx.send('Tag not found.')

        owner = ctx.bot.get_user(row['owner_id']) or await ctx.bot.get_user_info(row['owner_id'])

        embed = discord.Embed(title=row['name'], timestamp=row['created_at'])
        embed.add_field(name='Owner', value=owner.mention)
        embed.add_field(name='Uses', value=row['uses'])
        embed.add_field(name='Server Rank', value=row['server rank'])
        embed.add_field(name='Global Rank', value=row['global rank'])
        embed.set_footer(text='Tag created at')
        embed.set_author(name=owner, icon_url=owner.avatar_url)

        await ctx.send(embed=embed)

    @tag.group(name='stats', invoke_without_command=True)
    async def tag_stats(self, ctx, *, member: discord.Member = None):
        """Gives tag statistics for a member."""

        member = member or ctx.author

        embed = discord.Embed(color=member.color)
        embed.set_author(name=member, icon_url=member.avatar_url)

        query = """
                SELECT COUNT(*)
                FROM commands
                WHERE guild_id=$1
                AND author_id=$2
                AND command='tag';
                """
        count = await ctx.pool.fetchval(query, ctx.guild.id, member.id)

        embed.add_field(name='Tag Command Uses', value=count)

        query = 'SELECT COUNT(*) FROM tags WHERE location_id=$1 AND owner_id=$2;'
        count = await ctx.pool.fetchval(query, ctx.guild.id, member.id)

        embed.add_field(name='Owned Tags', value=count)

        query = 'SELECT SUM(uses) FROM tags WHERE location_id=$1 AND owner_id=$2;'
        count = await ctx.pool.fetchval(query, ctx.guild.id, member.id)

        embed.add_field(name='Owned Tag Uses', value=count)

        query = """
                SELECT name, uses
                FROM tags
                WHERE location_id=$1
                AND owner_id=$2
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id, member.id)
        value = '\n'.join(f'{index}: {tag} ({uses} uses)' for (index, (tag, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Owned Tags', value=value, inline=False)

        await ctx.send(embed=embed)

    @tag_stats.command(name='server')
    async def tag_stats_server(self, ctx):
        """Gives tag statistics for the server."""

        embed = discord.Embed(title='Server Tag Stats')

        query = 'SELECT COUNT(*) FROM tags WHERE location_id=$1;'
        count = await ctx.pool.fetchval(query, ctx.guild.id)

        embed.description = f'{count} tags'

        query = """
                SELECT name, uses
                FROM tags
                WHERE location_id=$1
                ORDER BY uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: {tag} ({uses} uses)' for (index, (tag, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Tags', value=value, inline=False)

        query = """
                SELECT author_id, COUNT(*) AS tag_uses
                FROM commands
                WHERE guild_id=$1
                AND command='tag'
                GROUP BY author_id
                ORDER BY tag_uses DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: <@!{author_id}> ({uses} uses)'
                          for (index, (author_id, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Tag Users', value=value, inline=False)

        query = """
                SELECT owner_id, COUNT(*) AS tags_created
                FROM tags
                WHERE location_id=$1
                GROUP BY owner_id
                ORDER BY tags_created DESC
                LIMIT 5;
                """
        records = await ctx.pool.fetch(query, ctx.guild.id)
        value = '\n'.join(f'{index}: <@!{owner_id}> ({uses} uses)'
                          for (index, (owner_id, uses)) in enumerate(records, 1))

        embed.add_field(name='Top Tag Creators', value=value, inline=False)

        await ctx.send(embed=embed)

    @tag.command(name='prefix', ignore_extra=False)
    @utils.mod_or_permissions()
    async def tag_prefix(self, ctx, prefix: valid_prefix):
        """Sets a prefix to be used as a shortcut for the tag command."""

        if prefix in ctx.bot.command_prefix(ctx.bot, ctx.message):
            return await ctx.send('This prefix is already used as a normal prefix.')

        await self.config.put(ctx.guild.id, prefix)
        await ctx.send('Tag shortcut prefix set')

    @tag_prefix.error
    async def tag_prefix_error(self, ctx, exception):
        if isinstance(exception, commands.TooManyArguments):
            await ctx.send('You must wrap the prefix in quotes.')

    async def on_message(self, message):
        if not message.guild or message.author.bot:
            return

        view = commands.view.StringView(message.content)
        prefix = self.config.get(message.guild.id)
        if not prefix:
            return

        if not view.skip_string(prefix):
            return

        mock_ctx = Mock()
        mock_ctx.bot = self.bot
        mock_ctx.pool = self.pool
        mock_ctx.guild = message.guild
        mock_ctx.channel = message.channel
        mock_ctx.author = message.author

        if not await self.bot.get_cog('Mod')._Mod__global_check(mock_ctx):
            return

        tag_name = view.read_rest().strip()
        query = 'SELECT id, content FROM tags WHERE location_id=$1 AND LOWER(name)=$2;'
        row = await self.pool.fetchrow(query, message.guild.id, tag_name.lower())
        if row:
            await message.channel.send(row['content'])
            query = 'UPDATE tags SET uses = uses + 1 WHERE id=$1'
            await self.pool.execute(query, row['id'])

            query = """
                    INSERT INTO commands (
                        guild_id,
                        channel_id,
                        author_id,
                        prefix,
                        command
                    ) VALUES ($1, $2, $3, $4, $5)
                    """
            await self.pool.execute(query, message.guild.id, message.channel.id, message.author.id, prefix, 'tag')


def setup(bot):
    bot.add_cog(Tags(bot))
