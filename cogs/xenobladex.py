import json
import math
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
    classes = [
        'Drifter', 'Deulist', 'Bastion Warrior', 'Full Metal Jaguar',
        'Astral Crusader', 'Mastermind', 'Galactic Knight'
    ]

    melee_weapons = [
        'Longsword', 'Shield', 'Dual Swords',
        'Javelin', 'Knife', 'Photon Saber'
    ]

    ranged_weapons = [
        'Assault Rifle', 'Gatling Gun', 'Dual Guns', 'Sniper Rifle',
        'Raygun', 'Psycho Launchers', 'Multigun'
    ]

    party_members = [
        'Elma', 'Lin', 'Gwin', 'Irina', 'Lao', 'Doug', 'L',
        'Murderess', 'Hope', 'Mia', 'Nagi', 'Phog', 'Frye',
        'Celica', 'Boze', 'Alexa', 'Yelv', 'H.B.'
    ]

    def __init__(self):
        self.data = {}
        self.colors = {
            'Common': 0x646864,
            'Rare': 0x0074A7,
            'Unique': 0x10AB6C,
            'Prime': 0x000000,
            'Intergalactic': 0xAB6C02,
        }

        for filename in ['skills', 'arts', 'augments', 'weapons', 'armors']:
            with open(f'xenox/json/{filename}.json') as f:
                setattr(self, filename, json.load(f))
                self.data[filename[:-1]] = getattr(self, filename)

        for key in self.data.keys():
            parent_command = getattr(self, key)
            env = {'parent_command': parent_command}
            env.update(globals())
            exec(thing.format(key, 'an' if key[0] == 'a' else 'a'), env)

        with open('xenox/json/materials.json') as f:
            self.materials = json.load(f)

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
    async def skill(self, ctx, *, name: str.lower):
        """Gives you information about a skill."""

        query = """
                SELECT name, effect, learned
                FROM xenox.skills
                WHERE LOWER(name)=$1;
                """

        record = await ctx.pool.fetchrow(query, name)

        if record is None:
            await ctx.send('Skill not found.')

        name, effect, learned = record

        embed = discord.Embed(title=name)
        embed.set_thumbnail(url='attachment://skill.png')
        embed.add_field(name='Learned', value=learned, inline=False)
        embed.add_field(name='Effect', value=effect)

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

        miranium = augment.get('Miranium')
        created = augment.get('Create')
        upgrade = augment.get('Upgrade')

        total_tickets = 0

        embed = discord.Embed(title=augment['Name'], color=self.colors[augment['Rarity']])
        embed.description = augment['Effect']

        embed.add_field(name='Sell Price', value=augment['Price'])

        if miranium:
            embed.add_field(name='Required Miranium', value=miranium)

        if created:
            fmt = []
            total = 0

            for mat in created[:-1]:
                name = mat["Name"]
                count = mat["Count"]
                tickets = self.materials[name.lower()]["price"] * count

                fmt.append(f'{count} {name} ({tickets} Tickets)')
                total += tickets

            fmt.append(f'{created[-1]["Count"]} {created[-1]["Name"]}')
            fmt.append(f'({total} Total Tickets)')

            embed.add_field(name='Create', value='\n'.join(fmt))

        if upgrade:
            fmt = []
            total = 0

            for mat in upgrade:
                name = mat["Name"]
                count = mat["Count"]
                tickets = self.materials[name.lower()]["price"] * count

                fmt.append(f'{count} {name} ({tickets} Tickets)')
                total += tickets

            fmt.append(f'({total} Total Tickets)')

            embed.add_field(name='Upgrade From', value='\n'.join(fmt))


        await ctx.send(embed=embed)

    @augment.error
    async def augment_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing augment name.')

    @commands.group(invoke_without_command=True)
    async def weapon(self, ctx, *, name: str):
        """Gives you information about a weapon."""

        try:
            weapon = self.get_entry('Weapon', name.lower())
        except RuntimeError as e:
            return await ctx.send(e)

        embed = discord.Embed(title=weapon['Name'])

        embed.add_field(name='Attack', value=weapon['Attack'])
        embed.add_field(name='Level', value=weapon['Level'])
        embed.add_field(name='Maker', value=weapon['Maker']['Name'])
        embed.add_field(name='Cooldown', value=weapon['Cooldown'])
        embed.add_field(name='TP Gain', value=weapon['TP Gain'])
        if weapon['Ammo']:
            embed.add_field(name='Ammo', value=weapon['Ammo'])
        embed.add_field(name='Attribute', value=weapon['Attribute'])
        embed.add_field(name='Stability', value=weapon['Stability'])
        embed.add_field(name='Upgrades', value=weapon['Upgrades'])
        embed.add_field(name='Sell Price', value=weapon['Sell Price'])

        if weapon['Innate Traits']:
            embed.add_field(name='Innate Traits', value='\n'.join(weapon['Innate Traits']), inline=False)

        if weapon['Possible Traits']:
            embed.add_field(name='Possible Traits', value='\n'.join(weapon['Possible Traits']), inline=False)

        await ctx.send(embed=embed)

    @weapon.error
    async def weapon_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing weapon name.')

    @commands.group(invoke_without_command=True, aliases=['armour'])
    async def armor(self, ctx, *, name: str):
        """Gives you information about an armor piece."""

        try:
            armor = self.get_entry('Armor', name.lower())
        except RuntimeError as e:
            return await ctx.send(e)

        embed = discord.Embed(title=armor['Name'])

        defenses = f'Defense: {armor["Defense"]}\n' \
                   f'Physical Res: {armor["Physical Resistance"]}\n' \
                   f'Beam Res: {armor["Beam Resistance"]}\n' \
                   f'Ether Res: {armor["Ether Resistance"]}\n' \
                   f'Electric Res: {armor["Electric Resistance"]}\n' \
                   f'Thermal Res: {armor["Thermal Resistance"]}\n' \
                   f'Gravity Res: {armor["Gravity Resistance"]}'

        embed.add_field(name='Level', value=armor['Level'])
        embed.add_field(name='Slot', value=armor['Armor Slot'])
        embed.add_field(name='Type', value=armor['Armor Type'])
        embed.add_field(name='Maker', value=armor['Maker']['Name'])
        embed.add_field(name='Upgrades', value=armor['Upgrades'])
        embed.add_field(name='Sell Price', value=armor['Sell Price'])
        embed.add_field(name='Defenses', value=defenses)

        if armor['Innate Traits']:
            embed.add_field(name='Innate Traits', value='\n'.join(armor['Innate Traits']))

        if armor['Possible Traits']:
            embed.add_field(name='Possible Traits', value='\n'.join(armor['Possible Traits']))

        await ctx.send(embed=embed)

    @armor.error
    async def armor_error(self, ctx, error):
        if isinstance(error, commands.MissingRequiredArgument):
            await ctx.send('Missing armor name.')
        
    @commands.command()
    async def loadout(self, ctx):
        fmt = f'Class: {random.choice(self.classes)}\n' \
              f'Melee Weapon: {random.choice(self.melee_weapons)}\n' \
              f'Ranged Weapon: {random.choice(self.ranged_weapons)}\n' \
              f'Party Members: {", ".join(random.sample(self.party_members, 3))}'

        await ctx.send(fmt)

    @commands.command()
    async def stat(self, ctx, level: int):
        hp = math.floor((((10000 - 250) / (99 - 1)) * (level - 1)) + 250)
        tp = 3000
        racc = math.floor((((360 - 105) / (99 - 1)) * (level - 1)) + 105)
        macc = math.floor((((370 - 104) / (99 - 1)) * (level - 1)) + 104)
        ratk = math.floor((((80 - 14) / (99 - 1)) * (level - 1)) + 14)
        matk = math.floor((((120 - 18) / (99 - 1)) * (level - 1)) + 18)
        eva = math.floor((((180 - 10) / (99 - 1)) * (level - 1)) + 10)
        pot = math.floor((((100 - 10) / (99 - 1)) * (level - 1)) + 10)

        fmt = f'```\nHP: {hp}\n' \
              f'TP: {tp}\n' \
              f'Ranged Accuracy: {racc}\n' \
              f'Melee Accuracy: {macc}\n' \
              f'Ranged Attack: {ratk}\n' \
              f'Melee Attack: {matk}\n' \
              f'Evasion: {eva}\n' \
              f'Potential: {pot}\n```' \

        await ctx.send(fmt)



def setup(bot):
    bot.add_cog(XenobladeX())
