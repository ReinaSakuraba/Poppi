import aiohttp
import asyncpg
from discord.ext import commands

from cogs.music import Player


class Context(commands.Context):
    @property
    def session(self) -> aiohttp.ClientSession:
        return self.bot.session

    @property
    def pool(self) -> asyncpg.pool.Pool:
        return self.bot.pool

    @property
    def player(self) -> Player:
        return self.bot.lavalink.players.get(self.guild.id) if self.guild else None
