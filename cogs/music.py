import re
import math
import random
import asyncio
import itertools
from collections import defaultdict

import lavalink
import discord
from discord.ext import commands

import utils


url_rx = re.compile('https?:\/\/(?:www\.)?.+')


class Track:
    def __init__(self, track, requester, channel):
        info = track['info']

        self.track = track['track']
        self.identifier = info['identifier']
        self.can_seek = info['isSeekable']
        self.author = info['author']
        self.duration = info['length']
        self.stream = info['isStream']
        self.title = info['title']
        self.uri = info['uri']

        self.thumbnail = f'https://img.youtube.com/vi/{self.identifier}/maxresdefault.jpg' if 'youtube' in self.uri else ''

        self.requester = requester
        self.channel = channel


class Player(lavalink.DefaultPlayer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.queue = utils.Playlist()

    async def add(self, track):
        await self.queue.put(track)

    async def play(self):
        if len(self.queue) == 0 and not self.repeat:
            self.current = None
            await self.stop()
            await self._lavalink.dispatch_event(lavalink.QueueEndEvent(self))
        else:
            track = self.current if self.repeat else await self.queue.get()
            self.repeat = False

            self.current = track
            await self._lavalink.ws.send(op='play', guildId=self.guild_id, track=track.track)
            await self._lavalink.dispatch_event(lavalink.TrackStartEvent(self, track))

        self.position = 0
        self.paused = False


class Music:
    def __init__(self, bot):
        self.bot = bot
        self.bot.lavalink.register_hook(self.track_hook)

    def __unload(self):
        self.bot.lavalink.unregister_hook(self.track_hook)

    async def track_hook(self, event):
        if isinstance(event, lavalink.Events.TrackStartEvent):
            embed = discord.Embed()
            embed.url = event.track.uri
            embed.title = f'Now playing {event.track.title}'
            if not event.track.stream:
                embed.add_field(name='Duration', value=utils.human_time(event.track.duration // 1000))
            embed.add_field(name='Requester', value=event.track.requester, inline=False)
            embed.set_thumbnail(url=event.track.thumbnail)

            await event.track.channel.send(embed=embed)
        elif isinstance(event, lavalink.Events.QueueEndEvent):
            await asyncio.sleep(60)
            if len(event.player.queue) == 0 and not event.player.is_playing:
                await event.player.disconnect()

                channel = self.bot.get_channel(event.player.fetch('channel'))
                if channel:
                    await channel.send('Disconnected because of inactivity.')

    async def on_voice_state_update(self, member, before, after):
        player = self.bot.lavalink.players.get(member.guild.id)

        if not player.is_connected:
            return

        channel = player.connected_channel
        before_channel = before.channel
        after_channel = after.channel

        if channel not in (before_channel, after_channel):
            return

        if len(channel.members) == 1:
            await player.set_pause(True)
            await asyncio.sleep(60)

            if len(channel.members) == 1:
                player.queue.clear()
                await player.disconnect()
                chan = self.bot.get_channel(player.fetch('channel'))
                if chan:
                    await chan.send('Disconnected because of inactivity.')
        else:
            await player.set_pause(False)

    @commands.command(aliases=['join'])
    async def summon(self, ctx, *, channel: discord.VoiceChannel = None):
        """Summons the bot to a voice channel."""

        channel = getattr(ctx.author.voice, 'channel', channel)

        if channel is None:
            return await ctx.send('No channel to join. Please either specify a valid channel or join one.')

        player = ctx.player

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

        player = ctx.player

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

        player = ctx.player

        if not player.is_playing:
            return await ctx.send('Not playing.')

        await ctx.send('Song skipped.')
        await player.skip()

    @commands.command(aliases=['resume'])
    async def pause(self, ctx):
        """Pauses or resumes the currently playing song."""

        player = ctx.player

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

        player = ctx.player

        if volume is None:
            return await ctx.send(f'Volume is set to {player.volume}%.')

        await player.set_volume(volume)
        await ctx.send(f'Volume set to {player.volume}%.')

    @commands.command()
    async def seek(self, ctx, seconds: int):
        """Seeks the song forwards or back."""

        player = ctx.player

        if not player.is_playing:
            return await ctx.send('Not playing.')

        seconds *= 1000

        track_time = player.position + seconds

        await player.seek(track_time)

        await ctx.send(f'Moved track to **{utils.digital_time(track_time // 1000)}**')

    @commands.command()
    async def remove(self, ctx, index: int):
        """Removes a song from the queue."""

        player = ctx.player

        if not player.queue:
            return await ctx.send('Nothing queued.')

        if index > len(player.queue) or index < 1:
            return await ctx.send(f'Index has to be greater than or equal to 1 and less than or equal to {len(player.queue)}.')

        removed = player.queue._queue[index - 1]
        player.queue._queue.remove(removed)

        await ctx.send(f'Removed {removed.title} from the queue.')

    @commands.command()
    async def clear(self, ctx):
        """Clears all songs from the queue."""

        player = ctx.player

        if len(player.queue) == 0:
            return await ctx.send('Nothing queued.')

        player.queue = []

        await ctx.send('Queue cleared.')

    @commands.command()
    async def repeat(self, ctx):
        """The currently playing wong will be repeated once."""

        player = ctx.player

        if not player.is_playing:
            return await ctx.send('Nothing playing.')

        player.repeat = not player.repeat

        await ctx.send(f'Currently playing song will {"" if player.repeat else "not "}repeat.')

    @commands.command()
    async def play(self, ctx, *, query):
        """Plays a song.

        If there is a song currently in the queue, then it is
        queued until the next song is done playing.

        This command automatically searches as well from YouTube.
        """

        player = ctx.player

        if not player.is_connected:
            await ctx.invoke(self.summon)

            if not player.is_connected:
                return

        else:
            if ctx.author not in player.connected_channel.members:
                return await ctx.send(f'You must be in {player.connected_channel.name} to request songs.')


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

        time_until_playing = f'Up next!' if time_until == 0 else utils.human_time(time_until // 1000)

        if time_until == time_remaining and time_until != 0:
            time_until_playing += ' (Next!)'

        if results['loadType'] == 'PLAYLIST_LOADED':
            tracks = results['tracks']

            duration = 0

            for track in tracks:
                duration += track['info']['length']
                await player.add(Track(track, ctx.author, ctx.channel))

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
            if not track['info']['isStream']:
                embed.add_field(name='Duration', value=utils.human_time(track['info']['length'] // 1000))
            embed.add_field(name='Time until playing', value=time_until_playing)
            await ctx.send(embed=embed)
            await player.add(Track(track, ctx.author, ctx.channel))

        if not player.is_playing:
            await player.play()

    @commands.command()
    async def playing(self, ctx):
        """Shows info about the currently playing song."""

        player = ctx.player

        if not player.current:
            return await ctx.send('Not currently playing anything.')

        embed = discord.Embed()
        embed.title = f'Currently playing {player.current.title}'
        embed.url = player.current.uri

        embed.set_thumbnail(url=player.current.thumbnail)

        embed.add_field(name='Requester', value=player.current.requester)

        position = utils.digital_time(player.position // 1000)

        if player.current.stream:
            duration = 'LIVE'
            embed.description = f'{position}/{duration}'
        else:
            progress_bar_length = 10
            filled = '\u2588'
            unfilled = '\u2003'
            ends = '\uff5c'

            index = player.position * progress_bar_length / player.current.duration
            fmt = f'{index / progress_bar_length:.0%}' \
                  f'{ends}{filled * round(index)}{unfilled * (progress_bar_length - round(index))}{ends}' \
                  f'{position}/{utils.digital_time(player.current.duration // 1000)}'
            embed.description = fmt


        await ctx.send(embed=embed)

    @commands.command()
    async def queue(self, ctx):
        """Shows the current queue."""

        player = ctx.player

        if len(player.queue) == 0:
            return await ctx.send('There\'s nothing in the queue! Why not queue something?')

        songs = [f'{i}: [{track.title}]({track.uri})\nRequested by {track.requester}' for i, track in enumerate(player.queue, 1)]

        try:
            paginator = utils.EmbedPaginator(ctx, entries=songs, per_page=10)
            paginator.embed.colour = 0x738bd7
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    @commands.command()
    async def shuffle(self, ctx):
        """Shuffles the current queue."""

        player = ctx.player

        if len(player.queue) == 0:
            return await ctx.send('There\'s nothing in the queue! Why not queue something?')

        player.queue.shuffle()

        await ctx.send('The queue has been shuffled.')


def setup(bot):
    bot.add_cog(Music(bot))
