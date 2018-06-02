import discord
from discord.ext import commands


class Gold:
    def __init__(self, pool):
        self.pool = pool

    @commands.command()
    async def gold(self, ctx, *, member: discord.Member = None):
        """Shows how much gold a user has."""

        member = member or ctx.author
        gold = await self.get_gold(ctx, ctx.author.id)

        await ctx.send(f'{member.display_name} has {gold} gold!')

    async def get_gold(self, ctx, user_id):
        query = "SELECT amount FROM bank WHERE user_id=$1;"
        gold = await ctx.pool.fetchval(query, ctx.author.id) or 0
        return gold

    async def add_gold(self, user_id, amount):
        query = """
                INSERT INTO bank (
                    user_id,
                    amount
                ) VALUES ($1, $2)
                ON CONFLICT (user_id)
                DO UPDATE
                SET amount = bank.amount + $2
                """
        await self.pool.execute(query, user_id, amount)                

    async def on_message(self, message):
        if message.author.bot:
            return

        await self.add_gold(message.author.id, 100)

    async def on_command(self, ctx):
        if ctx.author.bot:
            return

        await self.add_gold(ctx.author.id, 100)


def setup(bot):
    bot.add_cog(Gold(bot.pool))
