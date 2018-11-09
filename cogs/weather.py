import datetime

import discord
from discord.ext import commands

from bot import Bot
import utils


class Weather:
    @commands.command(aliases=['w', 'conditions'])
    async def weather(self, ctx: utils.Context, *, location: str):
        """Check the weather in a location"""

        base = f'http://api.apixu.com/v1/forecast.json?key={ctx.bot.config.apixu_key}&q={location}'

        async with ctx.session.get(base) as r:
            if r.status != 200:
                msg = 'There was an error with your request. Please try again with a different location.'
                return await ctx.send(msg)

            data = await r.json()

        location = data['location']
        locmsg = f'{location["name"]}, {location["region"]} {location["country"].upper()}'
        current = data['current']
        forecast = data['forecast']['forecastday'][0]['day']

        colour = 0xfeff3f if current['is_day'] != 0 else 0x37074b
        embed = discord.Embed(title=f'Weather for {locmsg}', description=f'*{current["condition"]["text"]}*',
                              colour=colour)
        embed.set_thumbnail(url=f'http:{current["condition"]["icon"]}')
        embed.add_field(name='Temperature', value=f'{current["temp_c"]}°C | {current["temp_f"]}°F')
        embed.add_field(name='Feels Like', value=f'{current["feelslike_c"]}°C | {current["feelslike_f"]}°F')
        embed.add_field(name='Min Temp Today', value=f'{forecast["mintemp_c"]}°C | {forecast["mintemp_f"]}°F')
        embed.add_field(name='Max Temp Today', value=f'{forecast["maxtemp_c"]}°C | {forecast["maxtemp_f"]}°F')
        embed.add_field(name='Average Temp Today', value=f'{forecast["avgtemp_c"]}°C | {forecast["avgtemp_f"]}°F')
        embed.add_field(name='Precipitation', value=f'{current["precip_mm"]} mm | {current["precip_in"]} in')
        embed.add_field(name='Humidity', value=f'{current["humidity"]}%')
        embed.add_field(name='Pressure', value=f'{current["pressure_mb"]} mb | {current["pressure_in"]} in')
        embed.add_field(name='Windspeed', value=f'{current["wind_kph"]} kph | {current["wind_mph"]} mph')
        embed.add_field(name='Wind Direction', value=current['wind_dir'])
        embed.add_field(name='Cloud Cover', value=f'{current["cloud"]}%')
        embed.timestamp = datetime.datetime.utcnow()

        await ctx.send(embed=embed)

    @weather.error
    async def weather_error(self, ctx: utils.Context, exception: commands.CommandError):
        if isinstance(exception, commands.MissingRequiredArgument):
            await ctx.send('Please provide a location to get Weather Information for.')


def setup(bot: Bot):
    bot.add_cog(Weather())
