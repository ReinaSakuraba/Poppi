import random

import discord
from discord.ext import commands

import utils


class Gold:
    def __init__(self, pool):
        self.pool = pool

    @utils.group(invoke_without_command=True)
    async def gold(self, ctx, *, member: discord.Member = None):
        """Shows how much gold a user has."""

        member = member or ctx.author
        gold = await self.get_gold(member.id)

        await ctx.send(f'{member.display_name} has {gold} gold!')

    @gold.command(name='give')
    async def gold_give(self, ctx, amount: int, *, member: discord.Member):
        """Gives gold to a user."""

        if amount < 0:
            return await ctx.send('Amount can not be less than 0.')

        if member == ctx.author:
            return await ctx.send('You can not give gold to yourself.')

        try:
            await self.remove_gold(ctx.author.id, amount)
        except RuntimeError as e:
            return await ctx.send(e)

        await self.add_gold(member.id, amount)

        await ctx.send(f'{ctx.author.display_name} gave {member.display_name} {amount} gold!')

    @utils.group(invoke_without_command=True)
    async def bet(self, ctx):
        """Bets gold."""
        pass

    @bet.command(name='rps')
    async def bet_rps(self, ctx, amount: int, choice: str):
        """Bets gold on a Rock Paper Scissors game."""

        original_amount = amount

        try:
            await self.remove_gold(ctx.author.id, amount)
        except RuntimeError as e:
            return await ctx.send(e)

        choices = ['rock', 'paper', 'scissors']

        try:
            player_choice = choices.index(choice.lower())
        except ValueError:
            return await ctx.send('Invalid choice')

        cpu_choice = random.choice((0, 1, 2))

        msg = f'I chose {choices[cpu_choice].title()}! '

        if (player_choice + 1) % 3 == cpu_choice:
            amount = 0
            msg += f'You lost {original_amount} gold!'
        elif player_choice == cpu_choice:
            msg += 'It\'s a tie!'
        else:
            amount *= 2
            msg += f'You won {original_amount} gold!'

        await self.add_gold(ctx.author.id, amount)
        await ctx.send(msg)

    async def get_gold(self, user_id):
        query = "SELECT amount FROM bank WHERE user_id=$1;"
        gold = await self.pool.fetchval(query, user_id) or 0
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

    async def remove_gold(self, user_id, amount):
        gold = await self.get_gold(user_id)

        if amount > gold:
            raise RuntimeError('Amount is over current gold.')

        query = "UPDATE bank SET amount = amount - $2 WHERE user_id=$1;"
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
