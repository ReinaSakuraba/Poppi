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

        if amount < 0:
            return await ctx.send('Amount can not be below 0.')

        original_amount = amount

        choices = ['rock', 'paper', 'scissors']

        try:
            player_choice = choices.index(choice.lower())
        except ValueError:
            return await ctx.send('Invalid choice.')

        try:
            await self.remove_gold(ctx.author.id, amount)
        except RuntimeError as e:
            return await ctx.send(e)

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

    @bet.command(name='flip')
    async def bet_flip(self, ctx, amount: int, choice: str):
        """Bets gold on a coin flip."""

        if amount < 0:
            return await ctx.send('Amount can not be below 0.')

        original_amount = amount

        choices = {
            'heads': 'heads',
            'head': 'heads',
            'h': 'heads',
            'tails': 'tails',
            'tail': 'tails',
            't': 'tails'
        }

        try:
            player_choice = choices[choice.lower()]
        except KeyError:
            return await ctx.send('Invalid choice.')

        try:
            await self.remove_gold(ctx.author.id, amount)
        except RuntimeError as e:
            return await ctx.send(e)

        cpu_choice = random.choice(('heads', 'tails'))

        if player_choice == cpu_choice:
            amount *= 2
            result = 'won'
        else:
            amount = 0
            result = 'lost'

        msg = f'The coin landed on {cpu_choice}! You {result} {original_amount} gold!'

        await self.add_gold(ctx.author.id, amount)
        await ctx.send(msg)

    @bet.command(name='roll')
    async def bet_roll(self, ctx, amount: int):
        """Bets gold on a 100 sided die."""

        if amount < 0:
            return await ctx.send('Amount can not be below 0.')

        original_amount = amount

        try:
            await self.remove_gold(ctx.author.id, amount)
        except RuntimeError as e:
            return await ctx.send(e)

        roll = random.randint(1, 100)

        msg = f'You rolled a {roll}!'

        if roll == 100:
            amount *= 10
            end = 'a 100'
        elif roll >= 90:
            amount *= 4
            end = 'above 90'
        elif roll >= 70:
            amount *= 3
            end = 'above 70'
        else:
            amount = 0
            end = 'below 70'

        amount_won = amount - original_amount
        result = 'won' if amount_won > 0 else 'lost'

        msg += f' You {result} {abs(amount_won)} gold for rolling {end}!'

        await self.add_gold(ctx.author.id, amount)
        await ctx.send(msg)

    @utils.group(invoke_without_command=True)
    async def shop(self, ctx):
        """Shows current items in the shop."""

        query = "SELECT item, price || 'G' FROM shop;"
        items = await ctx.pool.fetch(query)

        try:
            paginator = utils.FieldEmbedPaginator(ctx, entries=items)
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)


    @shop.command(name='buy')
    async def shop_buy(self, ctx, amount: int, *, item: str):
        """Buys an item from the shop."""

        if amount <= 0:
            return await ctx.send('You can not buy a negative amount of items.')

        query = "SELECT item, price FROM shop WHERE LOWER(item)=$1;"
        record = await ctx.pool.fetchrow(query, item.lower())

        if record is None:
            return await ctx.send('Item with that name was not found.')

        item, price = record

        if item == 'Sheba\'s Core Crystal':
            query = "SELECT amount FROM inventory WHERE user_id=$1 AND item='Sheba''s Core Crystal';"
            sheba_amount = await ctx.pool.fetchval(query, ctx.author.id)
            if int(sheba_amount) + amount > 1:
                return await ctx.send('You can not buy more of that item.')

        try:
            await self.remove_gold(ctx.author.id, price * amount)
        except RuntimeError as e:
            return await ctx.send('You do not have enough gold to buy this item.')

        query = """
                INSERT INTO inventory (
                    user_id,
                    item,
                    amount
                ) VALUES ($1, $2, $3)
                ON CONFLICT (user_id, item)
                DO UPDATE
                SET amount = inventory.amount + $3;
                """
        await ctx.pool.execute(query, ctx.author.id, item, amount)

        await ctx.send(f'Successfully bought {utils.plural(item, amount)}!')

    @commands.command()
    async def inventory(self, ctx):
        """Shows your current inventory."""

        query = "SELECT item, amount FROM inventory WHERE user_id=$1;"""
        items = await ctx.pool.fetch(query, ctx.author.id)

        if not items:
            return await ctx.send('You do not own any items.')

        try:
            paginator = utils.FieldEmbedPaginator(ctx, entries=items)
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    @commands.command()
    async def pull(self, ctx, *, core: str):
        """Pulls a blade with a Core Crystal."""

        cores = {
            'common core crystal': 'Common Core Crystal',
            'common core': 'Common Core Crystal',
            'common': 'Common Core Crystal',
            'rare core crystal': 'Rare Core Crystal',
            'rare core': 'Rare Core Crystal',
            'rare': 'Rare Core Crystal',
            'legendary core crystal': 'Legendary Core Crystal',
            'legendary core': 'Legendary Core Crystal',
            'legendary': 'Legendary Core Crystal'
        }

        try:
            core = cores[core.lower()]
        except KeyError:
            return await ctx.send('Invalid Core.')

        query = "SELECT amount FROM inventory WHERE item=$1 AND user_id=$2"
        amount = await ctx.pool.fetchval(query, core, ctx.author.id)

        if not amount:
            return await ctx.send('You do not have that Core Crystal.')

        query = """
                SELECT
                    ARRAY_AGG(blade),
                    ARRAY_AGG(probability)
                FROM xeno2.blade_chances
                WHERE seed=$1
                AND blade NOT IN ('Roc', 'Wulfric', 'Theory', 'Praxis', 'Sheba', 'Vess', 'Aegaeon', 'Herald', 'Kasandra')
                AND blade NOT IN (
                    SELECT blade
                    FROM pulled_blades
                    WHERE user_id=$2
                    AND common IS FALSE
                );
                """
        seed = (ctx.author.id >> 22) % 5  + 1
        blades, weights = await ctx.pool.fetchrow(query, seed, ctx.author.id)

        core_multipliers = {
            'Common Core Crystal': 1,
            'Rare Core Crystal': 1.5,
            'Legendary Core Crystal': 3
        }

        rare_chance = sum(weights) * core_multipliers[core]
        rand = random.random() * 100

        if rand < rare_chance:
            name = random.choices(blades, weights=map(float, weights))[0]
            common = False
            msg = f'You pulled {name}.'
        else:
            query = """
                    SELECT name
                    FROM xeno2.common_blade_names
                    WHERE name NOT IN (
                        SELECT blade
                        FROM pulled_blades
                        WHERE user_id=$1
                        AND common IS TRUE
                    )
                    ORDER BY RANDOM()
                    LIMIT 1;
                    """
            name = await ctx.pool.fetchval(query, ctx.author.id)
            common = True
            msg = f'You pulled a Common Blade named {name}.'

        query = """
                INSERT INTO pulled_blades (
                    user_id,
                    blade,
                    common
                ) VALUES ($1, $2, $3);
                """
        await ctx.pool.execute(query, ctx.author.id, name, common)

        query = "UPDATE inventory SET amount=amount-1 WHERE user_id=$1 AND item=$2;"
        await ctx.pool.execute(query, ctx.author.id, core)

        await ctx.send(msg)

    @commands.command()
    async def blades(self, ctx, *, member: discord.Member = None):
        """Shows a user's current Rare Blades."""

        member = member or ctx.author

        query = """
                SELECT
                    STRING_AGG(blade, E'\n')
                FROM pulled_blades
                WHERE user_id=$1
                AND common IS FALSE;
                """
        blades = await ctx.pool.fetchval(query, member.id)
        if blades is None:
            return await ctx.send(f'{member.display_name} has no Rare Blades.')

        await ctx.send(blades)

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
                SET amount = bank.amount + $2;
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
