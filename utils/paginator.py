import asyncio
from collections import OrderedDict

import discord


__all__ = ('CannotPaginate', 'Paginator', 'EmbedPaginator', 'FieldEmbedPaginator')


class CannotPaginate(Exception):
    pass


class Paginator:
    def __init__(self, ctx, *, entries):
        self.bot = ctx.bot
        self.entries = entries
        self.channel = ctx.channel
        self.author = ctx.author
        self.maximum_pages = len(entries)

        self.reaction_emojis = OrderedDict((
            ('\N{BLACK LEFT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR}', self.first_page),
            ('\N{BLACK LEFT-POINTING TRIANGLE}', self.previous_page),
            ('\N{BLACK RIGHT-POINTING TRIANGLE}', self.next_page),
            ('\N{BLACK RIGHT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR}', self.last_page),
            ('\N{INPUT SYMBOL FOR NUMBERS}', self.numbered_page),
            ('\N{BLACK SQUARE FOR STOP}', self.stop_pages),
        ))

        permissions = ctx.channel.permissions_for(ctx.me)

        if not permissions.embed_links:
            raise CannotPaginate('Bot does not have Embed Links permission.')

        if self.paginating:
            if not permissions.add_reactions:
                raise CannotPaginate('Bot does not have Add Reactions permission.')

            if not permissions.read_message_history:
                raise CannotPaginate('Bot does not have Read Message History permission.')

    @property
    def paginating(self):
        return len(self.entries) > 1

    async def show_page(self, page, *, first=False):
        if not self.paginating:
            return await self.channel.send(self.entries[0])

        self.current_page = page

        if not first:
            content = f'[{page}/{self.maximum_pages}]\n{self.entries[page - 1]}'
            return await self.message.edit(content=content)

        content = f'[{page}/{self.maximum_pages}]\n{self.entries[0]}'
        self.message = await self.channel.send(content)
        await self.add_reactions()

    async def add_reactions(self):
        for reaction in self.reaction_emojis:
            if self.maximum_pages == 2 and reaction in ('\u23ed', '\u23ee'):
                continue

            await self.message.add_reaction(reaction)

    async def checked_show_page(self, page):
        if 0 < page <= self.maximum_pages:
            await self.show_page(page)

    async def next_page(self):
        await self.checked_show_page(self.current_page + 1)

    async def previous_page(self):
        await self.checked_show_page(self.current_page - 1)

    async def first_page(self):
        await self.show_page(1)

    async def last_page(self):
        await self.show_page(self.maximum_pages)

    async def numbered_page(self):
        to_delete = [await self.channel.send('What page do you want to go to?')]

        def check(m):
            return m.author == self.author and self.channel == m.channel and \
                   m.content.isdigit()

        try:
            msg = await self.bot.wait_for('message', check=check, timeout=30.0)
        except asyncio.TimeoutError:
            to_delete.append(await self.channel.send('Took too long.'))
        else:
            page = int(msg.content)
            to_delete.append(msg)
            if page != 0 and page <= self.maximum_pages:
                await self.show_page(page)
            else:
                to_delete.append(await self.channel.send(f'Invalid page given. ({page}/{self.maximum_pages})'))
        await asyncio.sleep(5)

        try:
            await self.channel.delete_messages(to_delete)
        except Exception:
            pass

    async def stop_pages(self):
        await self.message.clear_reactions()

    def check(self, reaction, user):
        if user is None or user.id != self.author.id:
            return False

        if reaction.message.id != self.message.id:
            return False

        return reaction.emoji in self.reaction_emojis

    async def paginate(self):
        first_page = self.show_page(1, first=True)
        if not self.paginating:
            await first_page
        else:
            self.bot.loop.create_task(first_page)

        while self.paginating:
            try:
                wait_for = self.bot.wait_for('reaction_add', check=self.check, timeout=120.0)
                reaction, user = await wait_for
            except asyncio.TimeoutError:
                try:
                    await self.message.clear_reactions()
                finally:
                    break

            try:
                await self.message.remove_reaction(reaction, user)
            except:
                pass

            func = self.reaction_emojis.get(reaction.emoji)
            await func()
            if func is self.stop_pages:
                break


class EmbedPaginator(Paginator):
    def __init__(self, ctx, *, entries, per_page=10):
        self.per_page = per_page
        super().__init__(ctx, entries=entries)

        pages, left_over = divmod(len(entries), per_page)
        if left_over:
            pages += 1
        self.maximum_pages = pages
        self.embed = discord.Embed()

    @property
    def paginating(self):
        return len(self.entries) > self.per_page

    def get_page(self, page):
        base = (page - 1) * self.per_page
        return self.entries[base:base + self.per_page]

    async def show_page(self, page, *, first=False):
        self.current_page = page
        entries = self.get_page(page)

        text = f'{len(self.entries)} entr{"ies" if len(self.entries) > 1 else "y"}'
        if self.maximum_pages > 1:
            text = f'Page {page}/{self.maximum_pages} ({text})'
        self.embed.set_footer(text=text)

        self.embed.description = '\n'.join(entries)

        if not self.paginating:
            return await self.channel.send(embed=self.embed)

        if not first:
            return await self.message.edit(embed=self.embed)

        self.message = await self.channel.send(embed=self.embed)
        await self.add_reactions()


class FieldEmbedPaginator(EmbedPaginator):
    async def show_page(self, page, *, first=False):
        self.current_page = page
        entries = self.get_page(page)

        text = f'{len(self.entries)} entr{"ies" if len(self.entries) > 1 else "y"}'
        if self.maximum_pages > 1:
            text = f'Page {page}/{self.maximum_pages} ({text})'
        self.embed.set_footer(text=text)

        self.embed.clear_fields()

        for key, value in entries:
            self.embed.add_field(name=key, value=value, inline=False)

        if not self.paginating:
            return await self.channel.send(embed=self.embed)

        if not first:
            return await self.message.edit(embed=self.embed)

        self.message = await self.channel.send(embed=self.embed)
        await self.add_reactions()
