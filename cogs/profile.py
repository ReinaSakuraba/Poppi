import re

import discord
from discord.ext import commands

import utils


def valid_nnid(argument):
    arg = argument.strip('"')
    if len(arg) > 16:
        raise commands.BadArgument('An NNID has a maximum of 16 characters.')
    return arg


def valid_psn(argument):
    arg = argument.strip('"')
    if len(arg) > 16:
        raise commands.BadArgument('A PSN ID has a maximum of 16 characters.')
    return arg


_friend_code = re.compile(r'^(?:(?:SW|3DS)[- _]?)?(?P<one>[0-9]{4})[- _]?(?P<two>[0-9]{4})[- _]?(?P<three>[0-9]{4})$')


def valid_fc(argument):
    fc = argument.upper().strip('"')
    m = _friend_code.match(fc)
    if m is None:
        raise commands.BadArgument('Not a valid friend code!')

    return '{one}-{two}-{three}'.format(**m.groupdict())


class Profiles:
    """Profile related commands."""

    async def __error(self, ctx, error):
        if isinstance(error, commands.BadArgument):
            await ctx.send(error)

    async def get_profile(self, ctx, member):
        query = """SELECT * FROM profiles WHERE user_id=$1;"""

        profile = await ctx.pool.fetchrow(query, member.id)

        if profile is None:
            if member != ctx.author:
                await ctx.send('This user has not set up a profile.')
            else:
                await ctx.send(f'You have not set a profile. Check {ctx.prefix}help profile.')
        else:
            embed = discord.Embed()
            embed.set_author(name=member, icon_url=member.avatar_url)

            attrs = {
                'steam': 'Steam URL',
                'nnid': 'Nintendo Network ID',
                'fc_3ds': '3DS Friend Code',
                'fc_switch': 'Switch Friend Code',
                'psn': 'PlayStation Network ID',
                'other': 'Other'
            }

            for attr, name in attrs.items():
                value = profile[attr]
                if value is not None:
                    embed.add_field(name=name, value=value)

            await ctx.send(embed=embed)

    @utils.group(invoke_without_command=True)
    async def profile(self, ctx, *, member: discord.Member = None):
        """Manages your profile.

        If you don't pass in a subcommand, it will do a lookup based on
        the member passed in. If no member is passed in, you will
        get your own profile.

        All commands will create a profile for you.
        """

        member = member or ctx.author

        await self.get_profile(ctx, member)

    async def edit_field(self, attr, ctx, data):
        query = f"""
                INSERT INTO profiles (
                    user_id,
                    {attr}
                ) VALUES ($1, $2)
                ON CONFLICT (user_id)
                DO UPDATE
                SET {attr} = $2;
                """
        await ctx.pool.execute(query, ctx.author.id, data)

    @profile.command()
    async def steam(self, ctx, *, steam_url: str):
        """Sets the Steam URL portion of your profile."""

        await self.edit_field('steam', ctx, steam_url)
        await ctx.send('Updated Steam URL.')

    @profile.command()
    async def nnid(self, ctx, *, NNID: valid_nnid):
        """Sets the NNID portion of your profile."""

        await self.edit_field('nnid', ctx, NNID)
        await ctx.send('Updated NNID.')

    @profile.command(name='3ds')
    async def profile_3ds(self, ctx, *, friend_code: valid_fc):
        """Sets the 3DS Friend Code portion of your profile."""

        await self.edit_field('fc_3ds', ctx, friend_code)
        await ctx.send('Updated 3DS friend code.')

    @profile.command()
    async def switch(self, ctx, *, friend_code: valid_fc):
        """Sets the Switch Friend Code portion of your profile."""

        await self.edit_field('fc_switch', ctx, friend_code)
        await ctx.send('Updated Switch friend code.')

    @profile.command()
    async def psn(self, ctx, *, psn_id: valid_psn):
        """Sets the PSN ID portion of your profile."""

        await self.edit_field('psn', ctx, psn_id)
        await ctx.send('Updated PSN ID.')

    @profile.command()
    async def other(self, ctx, *, other: str):
        """Sets the Other portion of your profile."""

        await self.edit_field('other', ctx, other)
        await ctx.send('Updated Other.')

    @profile.command(aliases=['remove'])
    async def delete(self, ctx, *, field: str.lower = None):
        """Deletes certain fields from your profile.

        The valid fields that could be deleted are:

        - steam
        - nnid
        - 3ds
        - switch
        - psn
        - other

        Omitting any fields will delete your entire profile.
        """

        if field is None:
            query = """
                    DELETE FROM profiles
                    WHERE user_id=$1
                    RETURNING 1;
                    """
        else:
            valid_fields = ('steam', 'nnid', '3ds', 'switch', 'psn', 'other')
            if field not in valid_fields:
                 return await ctx.send('Not a valid field.')

            field = {'3ds': 'fc_3ds', 'switch': 'fc_switch'}.get(field, field)

            query = f"""
                    UPDATE profiles
                    SET {field} = NULL
                    WHERE user_id=$1
                    RETURNING 2;
                    """

        result = await ctx.pool.fetchval(query, ctx.author.id)

        if result == 1:
            return await ctx.send('Your profile has been deleted.')
        elif result == 2:
            return await ctx.send(f'The {field} field has been removed.')

        await ctx.send('You do not have a profile set up.')


def setup(bot):
    bot.add_cog(Profiles())
