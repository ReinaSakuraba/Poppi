import asyncio
import datetime
from collections import namedtuple

import asyncpg
import discord
from discord.ext import commands

import utils


Reminder = namedtuple('Reminder', 'id message author_id channel_id created expires')


class Reminders:
    def __init__(self, bot):
        self.bot = bot
        self.pool = bot.pool
        self._task = bot.loop.create_task(self.dispatch_reminders())
        self._current_reminder = None
        self._event = asyncio.Event(loop=bot.loop)

    def __unload(self):
        self._task.cancel()

    async def dispatch_reminders(self):
        await self.bot.wait_until_ready()
        try:
            while not self.bot.is_closed():
                reminder = self._current_reminder = await self.get_reminder()

                now = datetime.datetime.utcnow()
                if reminder.expires < now:
                    await self.call_reminder(reminder)
                else:
                    to_sleep = (reminder.expires - now).total_seconds()
                    await asyncio.sleep(min(to_sleep, 3_456_000))
        except asyncio.CancelledError:
            pass
        except (OSError, discord.ConnectionClosed, asyncpg.PostgresConnectionError):
            self._task.cancel()
            self._task = self.bot.loop.create_task(self.dispatch_reminders())

    async def get_reminder(self):
        query = 'SELECT * FROM reminders ORDER BY expires LIMIT 1;'
        record = await self.pool.fetchrow(query)

        if record:
            return Reminder(**record)

        self._current_reminder = None
        self._event.clear()
        await self._event.wait()
        return await self.get_reminder()

    async def call_reminder(self, reminder):
        query = 'DELETE FROM reminders WHERE id=$1;'
        await self.pool.execute(query, reminder.id)

        channel = self.bot.get_channel(reminder.channel_id) or self.bot.get_user(reminder.author_id)
        if channel is None:
            return

        time = utils.human_timedelta(datetime.datetime.utcnow(), source=reminder.created)

        message = f'<@{reminder.author_id}>, {time} ago you asked to be reminded about "{reminder.message}".'

        try:
            await channel.send(message)
        except (discord.HTTPException, discord.Forbidden):
            pass

    async def schedule_reminder(self, ctx, message, expires):
        query = """
                INSERT INTO reminders (
                    message,
                    author_id,
                    channel_id,
                    created,
                    expires
                ) VALUES ($1, $2, $3, $4, $5);
                """
        await self.pool.execute(query, message, ctx.author.id, ctx.channel.id, ctx.message.created_at, expires)

        self._event.set()

        if self._current_reminder and self._current_reminder.expires > expires:
            self._task.cancel()
            self._task = self.bot.loop.create_task(self.dispatch_reminders())

    @utils.group(aliases=['remind', 'timer'], invoke_without_command=True)
    async def reminder(self, ctx, *, when: utils.Time):
        """Reminds you of something after a certain amount of time.

        The input can be any direct date (e.g. YYYY-MM-DD) or a human
        readable offset. Examples:

        - "next thursday at 3pm do something funny"
        - "do the dishes tomorrow"
        - "in 3 days do the thing"
        - "2d unmute someone"

        Times are in UTC.
        """

        await self.schedule_reminder(ctx, when.message, when.dt)

        time = utils.human_timedelta(when.dt, source=datetime.datetime.utcnow().replace(microsecond=0))
        await ctx.send(f'I\'ll remind you about {when.message} in {time}.')

    @reminder.error
    async def reminder_error(self, ctx, exception):
        if isinstance(exception, commands.BadArgument):
            await ctx.send(exception)

    @reminder.command(name='list')
    async def reminder_list(self, ctx):
        """Shows your currently running reminders."""

        query = 'SELECT id, expires, message FROM reminders WHERE author_id=$1 ORDER BY id;'
        records = await ctx.pool.fetch(query, ctx.author.id)
        if not records:
            return await ctx.send('You do not have any running reminders.')

        entries = [(f'{id}: {utils.human_timedelta(expires)} from now', message) for id, expires, message in records]

        try:
            paginator = utils.FieldEmbedPaginator(ctx, entries=entries, per_page=5)
            paginator.embed.title = 'Reminders'
            await paginator.paginate()
        except utils.CannotPaginate as e:
            await ctx.send(e)

    @commands.command()
    async def reminders(self, ctx):
        """An alias for the reminder list command."""

        await ctx.invoke(self.reminder_list)

    @reminder.command(name='remove', aliases=['delete'])
    async def reminder_remove(self, ctx, id: int):
        """Removes a currently running reminder.

        Reminder IDs can be obtained using the reminder list
        command.
        """

        query = 'SELECT author_id FROM reminders WHERE id=$1;'
        author_id = await ctx.pool.fetchval(query, id)
        if author_id is None:
            return await ctx.send(f'A reminder with an ID of {id} does not exist.')

        if ctx.author.id != author_id:
            return await ctx.send('You do not own this reminder.')

        query = 'DELETE FROM reminders WHERE id=$1;'
        await ctx.pool.execute(query, id)
        await ctx.send('This reminder has been removed.')


def setup(bot):
    bot.add_cog(Reminders(bot))
