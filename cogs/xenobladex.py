import json
import random
import difflib
import discord

from discord.ext import commands

import utils


thing = '''
@parent_command.command(name='all')
async def {0}_all(ctx):
    """Gives you a list off all {0}s."""
    data = ctx.command.parent.instance.data["{0}"]
    results = [v['Name'] for k, v in data.items()]
    try:
        p = utils.EmbedPaginator(ctx, entries=results, per_page=15)
        p.embed.colour = 0x738bd7
        await p.paginate()
    except Exception as e:
        await ctx.send(e)

@parent_command.command(name='search')
async def {0}_search(ctx, *, query: str):
    """Searches for {1} {0}."""
    query  = query.lower()
    data = ctx.command.parent.instance.data["{0}"]
    results = [v['Name'] for k, v in data.items() if query in k]
    results.sort()
    if results:
        try:
            p = utils.EmbedPaginator(ctx, entries=results, per_page=15)
            p.embed.colour = 0x738bd7
            await p.paginate()
        except Exception as e:
            await ctx.send(e)
    else:
        await ctx.send('No {0} found.')

@{0}_search.error
async def {0}_search_error(ctx, error):
    if isinstance(error, commands.MissingRequiredArgument):
        await ctx.send('Missing query.')
'''


class XenobladeX:
    def __init__(self):
        self.data = {}
        self.colors = {
            'Common': 0x646864,
            'Rare': 0x0074A7,
            'Unique': 0x10AB6C,
            'Intergalactic': 0xAB6C02,
        }

        for filename in ['skills', 'arts', 'augments']:
            with open(f'xenox/json/{filename}.json') as f:
                setattr(self, filename, json.load(f))
                self.data[filename[:-1]] = getattr(self, filename)

        for key in self.data.keys():
            parent_command = getattr(self, key)
            env = {'parent_command': parent_command}
            env.update(globals())
            exec(thing.format(key, 'an' if key[0] == 'a' else 'a'), env)

    def get_entry(self, entry_type, name):
        data = self.data[entry_type.lower()]
        try:
            return data[name]
        except KeyError:
            possible_matches = difflib.get_close_matches(name, data, 1000)
            if not possible_matches:
                raise RuntimeError(f'{entry_type} not found.')

            items = data.items()
            entry_list = [v['Name'] for k, v in items if k in possible_matches]
            possible_entries = '\n'.join(entry_list)
            raise RuntimeError(f'{entry_type} not found. Did you mean...\n{possible_entries}')

    @utils.group(invoke_without_command=True)
    async def skill(self, ctx, *, skill: str):
        """Gives you information about a skill."""

        try:
            skill = self.get_entry('Skill', skill.lower())
        except RuntimeError as e:
            return await ctx.send(e)

        name = skill['Name']

        embed = discord.Embed(title=name)
        embed.set_thumbnail(url='attachment://skill.png')
        embed.add_field(name='Learned', value=skill['Class/Rank'], inline=False)
        embed.add_field(name='Effect', value=skill['Effect'])

        await ctx.send(file=discord.File(f'xenox/skills/{name}.png', 'skill.png'), embed=embed)

    @skill.error
    async def skill_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing skill name.')

    @utils.group(invoke_without_command=True)
    async def art(self, ctx, *, art: str):
        """Gives you information about an art."""
        try:
            art = self.get_entry('Art', art.lower())
        except RuntimeError as e:
            return await ctx.send(e)

        name = art['Name']
        description = art['Description']
        weapon = art['Weapon']
        learned = art['Class/Rank']
        effect_range = art['Effect Range']
        attribute = art['Attribute']
        hits = art['Hits']
        scaling = art['Hit Scaling']
        cooldown = art['Cooldown']
        cooldown_bonus = art['Secondary/Tertiary']
        special_effects = art['Special Effects']
        aura_effects = art['Aura Effects']
        extra_effects = art['Extra Effects']
        additional_effects = art['Additional Effects']
        effects = art['Effects']
        aura = art['Aura']
        duration = art['Effect Duration']

        embed = discord.Embed(title=name)
        embed.set_thumbnail(url='attachment://art.png')
        embed.add_field(name='Weapon', value=weapon)
        embed.add_field(name='Learned', value=learned)
        embed.add_field(name='Effect Range', value=effect_range)
        if attribute:
            embed.add_field(name='Attribute', value=attribute)
        if hits:
            embed.add_field(name='Hits', value=hits)
        if scaling:
            embed.add_field(name='Hit Scaling', value=scaling)
        embed.add_field(name='Cooldown', value=cooldown)
        embed.add_field(name='Cooldown Bonus', value=cooldown_bonus)
        if special_effects:
            embed.add_field(name='Special Effects', value=special_effects,
                            inline=False)
        if aura_effects:
            embed.add_field(name='Aura Effects', value=aura_effects,
                            inline=False)
        if extra_effects:
            embed.add_field(name='Extra Effects', value=extra_effects,
                            inline=False)
        if additional_effects:
            embed.add_field(name='Additional Effects',
                            value=additional_effects)
        if effects:
            embed.add_field(name='Effects', value=effects)
        if aura:
            embed.add_field(name='Aura', value=aura)
        if duration:
            embed.add_field(name='Duration', value=duration)
        embed.add_field(name='Description', value=description, inline=False)
        await ctx.send(file=discord.File(f'xenox/arts/{name}.png', 'art.png'),
                       embed=embed)

    @art.error
    async def art_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing art name.')

    @utils.group(invoke_without_command=True, aliases=['aug'])
    async def augment(self, ctx, *, augment: str):
        """Gives you information about an augment."""
        try:
            augment = self.get_entry('Augment', augment.lower())
        except RuntimeError as e:
            return await ctx.send(e)

        name = augment['Name']
        effect = augment['Effect']
        rarity = augment.get('Rarity')
        type = augment['Type']
        price = augment.get('Sell Price')
        miranium = augment.get('Required Miranium')
        mat_1 = augment.get('Material 1')
        mat_2 = augment.get('Material 2')
        mat_3 = augment.get('Material 3')
        drop = augment.get('Drop')
        resource = augment.get('Precious Resource')

        embed = discord.Embed(title=name)
        if rarity:
            embed.color = self.colors[rarity]
        embed.add_field(name='Effect', value=effect, inline=False)
        if type != 'Augment':
            embed.add_field(name='Type', value=type)
        if price:
            embed.add_field(name='Sell Price', value=price)
        if miranium:
            embed.add_field(name='Required Miranium', value=miranium)
        if mat_1:
            embed.add_field(name='Material 1', value=f'{mat_1["Amount"]} {mat_1["Name"]}')
        if mat_2:
            embed.add_field(name='Material 2', value=f'{mat_2["Amount"]} {mat_2["Name"]}')
        if mat_3:
            embed.add_field(name='Material 3', value=f'{mat_3["Amount"]} {mat_3["Name"]}')
        if drop:
            embed.add_field(name='Drop', value=drop)
        if resource:
            embed.add_field(name='Precious Resource', value=f'{resource["Amount"]} {resource["Name"]}', inline=False)
        await ctx.send(embed=embed)

    @augment.error
    async def art_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing augment name.')


def setup(bot):
    bot.add_cog(XenobladeX())
