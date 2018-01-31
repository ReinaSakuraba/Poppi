import re
import asyncio

import asyncpg
import discord
from discord.ext import commands

import utils


class Tags:
    async def __error(self, ctx, exception):
        if isinstance(exception, commands.UserInputError):
            await ctx.send(exception)

    @utils.group(invoke_without_command=True)
    async def tag(self, ctx, *, tag: utils.TagName):
        query = """
                SELECT id, content
                FROM tags
                WHERE location_id=$1 AND LOWER(name)=$2;
                """
        row = await ctx.pool.fetchrow(query, ctx.guild.id, tag.lower())

        if row is None:
            return await ctx.send('No tag found')

        await ctx.send(row['content'])

        query = 'UPDATE tags SET uses = uses + 1 WHERE id=$1'
        await ctx.pool.execute(query, row['id'])

    @tag.command(name='raw')
    async def tag_raw(self, ctx, *, tag: utils.TagName):
        """Gets the raw content of the tag.

        This is with markdown escaped. Useful for editing.
        """

        query = """
                SELECT id, content
                FROM tags
                WHERE location_id=$1 AND LOWER(name)=$2;
                """
        row = await ctx.pool.fetchrow(query, ctx.guild.id, tag.lower())

        if row is None:
            return await ctx.send('No tag found')


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

    @tag.command(name='remove', aliases=['delete'])
    async def tag_remove(self, ctx, *, name: utils.TagName):
        """Removes a tag that you own.

        The tag owner can always delete their own tags. If someone requests
        deletion and has Manage Server permissions then they can also
        delete it.
        """

        params = [name, ctx.guild.id]
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
            return await ctx.send('Either this tag does not exist or you do not have permission to edit it.')

        await ctx.send('Tag successfully removed.')

    @tag.command(name='edit')
    async def tag_edit(self, ctx, name: utils.TagName, *, content: commands.clean_content):
        """Modifies an existing tag that you own.

        This command completely replaces the original text. If
        you want to get the old text back, consider using the
        tag raw command.
        """

        query = 'UPDATE tags SET content=$1 WHERE LOWER(name)=$2 AND location_id=$3 AND owner_id=$4 RETURNING 1;'
        status = await ctx.pool.fetchval(query, content, name, ctx.guild.id, ctx.author.id)

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
            status = await ctx.pool.fetchval(query, new_name, name, ctx.guild.id, ctx.author.id)
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
        """An alias for tag list command."""

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


def setup(bot):
    bot.add_cog(Tags())
