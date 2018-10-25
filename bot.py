import datetime
import traceback
from pathlib import Path

import psutil
import aiohttp
import discord
from discord.ext import commands
import lavalink

import config
import utils
from cogs import music


def _get_prefix(bot, message, *, mentions=True):
    prefixes = commands.when_mentioned(bot, message) if mentions else []
    if message.guild is None:
        prefixes.append(config.prefix)
    else:
        prefixes.extend(bot.prefixes.get(message.guild.id, [config.prefix]))
    return prefixes


class Bot(commands.Bot):
    def __init__(self, *, pool, **kwargs):
        super().__init__(command_prefix=_get_prefix, description=config.description,
                         pm_help=None, game=discord.Game(name=config.game), **kwargs)

        self.all_commands = utils.CaseInsensitiveDict(self.all_commands)

        self.pool = pool
        self.prefixes = utils.Config('prefixes.json', loop=self.loop)
        self.session = aiohttp.ClientSession(loop=self.loop)
        self.lavalink = lavalink.Client(bot=self, loop=self.loop, host=config.lava_host,
                                        rest_port=config.lava_rest, ws_port=config.lava_ws,
                                        password=config.lava_pass, player=music.Player)
        self.process = psutil.Process()

        for extension in self.startup_extensions:
            try:
                self.load_extension(extension)
            except Exception as e:
                print(f'Failed to load extension {extension}')
                traceback.print_exc()

        self.loop.create_task(self.init())

    async def init(self):
        await self.wait_until_ready()
        self.start_time = datetime.datetime.utcnow()

        info = await self.application_info()
        self.owner_id = info.owner.id

        if self.feedback_channel is None:
            self.remove_command('feedback')

    async def set_prefixes(self, guild_id, prefixes):
        if len(prefixes) > 10:
            raise RuntimeError('Cannot have more than 10 custom prefixes.')

        await self.prefixes.put(guild_id, sorted(set(prefixes), reverse=True))

    @property
    def owner(self):
        return self.get_user(self.owner_id)

    @property
    def uptime(self):
        return utils.human_timedelta(datetime.datetime.utcnow(), source=self.start_time)

    @property
    def memory_usage(self):
        memory_usage = self.process.memory_full_info().uss / 1024 ** 2
        return f'{memory_usage:.2f} MiB'

    @property
    def cpu_usage(self):
        cpu_usage = self.process.cpu_percent() / psutil.cpu_count()
        return f'{cpu_usage}%'

    @property
    def startup_extensions(self):
        return [f'cogs.{x.stem}' for x in Path('cogs').glob('*.py')]

    @property
    def feedback_channel(self):
        return self.get_channel(config.feedback_channel)

    @property
    def config(self):
        return config

    async def close(self):
        await self.session.close()
        await super().close()

    async def on_ready(self):
        print(f'Logged in as {self.user}')
        print('---------')

    async def on_message(self, message):
        if message.author.bot:
            return

        ctx = await self.get_context(message, cls=utils.Context)
        await self.invoke(ctx)

    async def on_command(self, ctx):
        guild_id = ctx.guild.id if ctx.guild else None
        query = """
                INSERT INTO commands (
                    guild_id,
                    channel_id,
                    author_id,
                    prefix,
                    command
                ) VALUES ($1, $2, $3, $4, $5);
                """
        await self.pool.execute(query, guild_id, ctx.channel.id, ctx.author.id, ctx.prefix, ctx.command.qualified_name)
