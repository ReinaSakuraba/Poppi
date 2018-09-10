import re
import asyncio

import lavalink
import discord
from discord.ext import commands

import utils


url_rx = re.compile('https?:\/\/(?:www\.)?.+')


class Music:
    def __init__(self, bot):
        self.bot = bot
        self.bot.lavalink.register_hook(self.track_hook)

    def __unload(self):
        self.bot.lavalink.unregister_hook(self.track_hook)

    async def track_hook(self, event):
        if isinstance(event, lavalink.Events.TrackStartEvent):
            channel = self.bot.get_channel(event.player.fetch('channel'))
            if channel:
                embed = discord.Embed()
                embed.url = event.track.uri
                embed.title = f'Now playing {event.track.title}'
                embed.add_field(name='Duration', value=utils.human_time(event.track.duration // 1000))
                embed.add_field(name='Requester', value=channel.guild.get_member(event.track.requester), inline=False)
                embed.set_thumbnail(url=event.track.thumbnail)

                await channel.send(embed=embed)

    @commands.command(aliases=['join'])
    async def summon(self, ctx, *, channel: discord.VoiceChannel = None):
        """Summons the bot to a voice channel."""

        channel = getattr(ctx.author.voice, 'channel', channel)

        if channel is None:
            return await ctx.send('No channel to join. Please either specify a valid channel or join one.')

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_connected:
            try:
                await player.connect(channel.id)
            except Exception:
                return await ctx.send('Unable to connect to the voice channel.')
            else:
                player.store('channel', ctx.channel.id)
                return await ctx.send(f'Connected to {channel.name}.')

        if channel == player.connected_channel:
            return await ctx.send('I am already in this channel.')

        try:
            await player.connect(channel.id)
        except Exception:
            await ctx.send('Unable to move to this voice channel.')

        player.store('channel', ctx.channel.id)
        await ctx.send(f'Moved to {channel.name}.')

    @commands.command()
    async def stop(self, ctx):
        """Stops playing audio and leaves the voice channel.

        This also clears the queue.
        """

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_connected:
            return await ctx.send('Not in a voice channel.')

        player.queue.clear()
        await player.disconnect()
        await ctx.send('Disconnected.')

    @commands.command()
    async def skip(self, ctx):
        """Vote to skip a song.

        The song requester can automatically skip.

        Approximately 1/3 of the members in the voice channel
        are required to vote to skip for the song to be skipped.
        """

        player = self.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_playing:
            return await ctx.send('Not playing.')

        await ctx.send('Song skipped.')
        await player.skip()

    @commands.command(aliases=['resume'])
    async def pause(self, ctx):
        player = self.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_playing:
            return await ctx.send('Not playing.')

        if player.paused:
            await player.set_pause(False)
            await ctx.send('Song resumed.')
        else:
            await player.set_pause(True)
            await ctx.send('Song paused.')

    @commands.command()
    async def volume(self, ctx, volume: int = None):
        """Sets the volume of the currently playing song."""

        player = self.bot.lavalink.players.get(ctx.guild.id)

        if not volume:
            return await ctx.send(f'Volume is set to {player.volume}%.')

        await player.set_volume(volume)
        await ctx.send(f'Volume set to {player.volume}%.')

    @commands.command()
    async def seek(self, ctx, seconds: int):
        """Seeks the song forwards or back."""

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_playing:
            return await ctx.send('Not playing.')

        seconds *= 1000

        track_time = player.position + seconds

        await player.seek(track_time)

        await ctx.send(f'Moved track to **{self.format_time(track_time)}**')


    @commands.command()
    async def play(self, ctx, *, query):
        """Plays a song.

        If there is a song currently in the queue, then it is
        queued until the next song is done playing.

        This command automatically searches as well from YouTube.
        """

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if not player.is_connected:
            await ctx.invoke(self.summon)
            player = ctx.bot.lavalink.players.get(ctx.guild.id)

            if player is None:
                return

        else:
            if ctx.author not in player.connected_channel.members:
                return await ctx.send(f'You must be in {vc.channel.name} to request songs.')


        query = query.strip('<>')

        if not url_rx.match(query):
            query = f'ytsearch:{query}'

        results = await ctx.bot.lavalink.get_tracks(query)

        if not results or not results['tracks']:
            return await ctx.send('Nothing found!')

        embed = discord.Embed()

        time_until = 0
        time_remaining = 0

        for track in player.queue:
            time_until += track.duration

        if player.is_playing:
            time_remaining = player.current.duration - player.position

        time_until += time_remaining

        time_until_playing = 'Up next!' if time_until == 0 or time_until == time_remaining else utils.human_time(time_until // 1000)

        if results['loadType'] == 'PLAYLIST_LOADED':
            tracks = results['tracks']

            duration = 0

            for track in tracks:
                duration += track['info']['length']
                player.add(requester=ctx.author.id, track=track)

            embed.title = f'Enqueued {results["playlistInfo"]["name"]}'
            embed.add_field(name='Tracks', value=len(tracks))
            embed.add_field(name='Duration', value=utils.human_time(duration // 1000))
            embed.add_field(name='Time until playing', value=time_until_playing)
            await ctx.send(embed=embed)
        else:
            track = results['tracks'][0]
            embed.title = f'Enqueued {track["info"]["title"]}'
            embed.url = track['info']['uri']
            if 'youtube' in embed.url:
                embed.set_thumbnail(url=f'https://img.youtube.com/vi/{track["info"]["identifier"]}/default.jpg')
            embed.add_field(name='Duration', value=utils.human_time(track['info']['length'] // 1000))
            embed.add_field(name='Time until playing', value=time_until_playing)
            await ctx.send(embed=embed)
            player.add(requester=ctx.author.id, track=track)

        if not player.is_playing:
            await player.play()

    @commands.command()
    async def playing(self, ctx):
        """Shows info about the currently playing song."""

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if not player.current:
            return await ctx.send('Not currently playing anything.')

        embed = discord.Embed()
        embed.title = f'Currently playing {player.current.title}'
        embed.url = player.current.uri

        embed.set_thumbnail(url=player.current.thumbnail)

        embed.add_field(name='Requester', value=ctx.guild.get_member(player.current.requester))

        position = self.format_time(player.position)

        if player.current.stream:
            dur = 'LIVE'
            embed.description = f'{position}/{duration}'
        else:
            progress_bar_length = 10
            filled = '\u2588'
            unfilled = '\u2003'
            ends = '\uff5c'

            index = player.position * progress_bar_length / player.current.duration
            fmt = f'{index / progress_bar_length:.0%}' \
                  f'{ends}{filled * round(index)}{unfilled * (progress_bar_length - round(index))}{ends}' \
                  f'{position}/{self.format_time(player.current.duration)}'
            embed.description = fmt


        await ctx.send(embed=embed)

    @commands.command()
    async def queue(self, ctx):
        """Shows the current queue."""

        player = ctx.bot.lavalink.players.get(ctx.guild.id)

        if len(player.queue) == 0:
            return await ctx.send('There\'s nothing in the queue! Why not queue something?')

        songs = [f'{i}: [{track.title}]({track.uri})\nRequested by {ctx.guild.get_member(track.requester)}' for i, track in enumerate(player.queue, 1)]

        try:
            paginator = utils.EmbedPaginator(ctx, entries=songs, per_page=10)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    @staticmethod
    def format_time(seconds):
        seconds //= 1000

        if seconds >= 3600:
            return f'{seconds//3600:02}:{seconds%3600//60:02}:{seconds%60:02}'
        return f'{seconds//60:02}:{seconds%60:02}'


def setup(bot):
    bot.add_cog(Music(bot))
