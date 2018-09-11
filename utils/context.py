from discord.ext import commands


class Context(commands.Context):
    @property
    def session(self):
        return self.bot.session

    @property
    def pool(self):
        return self.bot.pool

    @property
    def player(self):
        return self.bot.lavalink.players.get(self.guild.id) if self.guild else None
