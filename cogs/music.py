import io
import json
import math
import random
import audioop
import asyncio
import datetime
import functools
import subprocess

import youtube_dl
import discord
from discord.ext import commands

import utils


downloader = utils.Downloader()


def get_duration(url):
    cmd = f'ffprobe -v error -show_format -of json {url}'
    process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = process.communicate()
    data = json.loads(output)
    duration = data['format']['duration']

    return math.ceil(float(duration))


class YTDLEntry:
    def __init__(self, info):
        self.url = info.get('webpage_url')
        self.download_url = url = info.get('url')
        self.views = info.get('view_count')
        self.is_live = bool(info.get('is_live'))
        self.likes = info.get('likes')
        self.dislikes = info.get('dislikes')
        self.duration = info.get('duration') or get_duration(url)
        self.uploader = info.get('uploader')
        self.id = info.get('id')
        if 'twitch' in self.url:
            self.title = info.get('description')
            self.description = None
        else:
            self.title = info.get('title')
            self.description = info.get('description')

        date = info.get('upload_date')
        if date:
            try:
                date = datetime.datetime.strptime(date, '%Y%M%d').date()
            except ValueError:
                date = None

        self.upload_date = date


class YTDLSource(discord.AudioSource):
    def __init__(self, ctx, entry):
        self.requester = ctx.author
        self.channel = ctx.channel
        self.frames = 0
        self.entry = entry
        self.skip_votes = set()
        self._volume = 1.0

    @classmethod
    async def from_url(cls, ctx, url):
        info = await cls.get_info(url)
        return cls(ctx, info)

    async def start(self):
        self.entry = await self.get_info(self.entry.url)
        self.source = discord.FFmpegPCMAudio(self.entry.download_url, before_options='-reconnect 1')

    @staticmethod
    async def get_info(url):
        info = await downloader.extract_info(url, download=False)
        if 'entries' in info:
            info = info['entries'][0]

        entry = YTDLEntry(info)
        return entry

    def read(self):
        self.frames += 1
        return audioop.mul(self.source.read(), 2, self._volume)

    def cleanup(self):
        if hasattr(self, 'source'):
            self.source.cleanup()

    def __del__(self):
        if hasattr(self, 'source'):
            self.source.cleanup()

    @property
    def volume(self):
        return self._volume

    @volume.setter
    def volume(self, value):
        self._volume = min(2.0, max(0.0, value))

    @property
    def required_skips(self):
        members = len(self.channel.guild.voice_client.channel.members) - 1
        return math.ceil(members / 3)

    @property
    def length(self):
        return self.entry.duration

    @property
    def progress(self):
        return round(self.frames/50)

    @property
    def remaining(self):
        length = self.length
        progress = self.progress
        return length - progress

    def embed(self):
        embed = discord.Embed()
        embed.title = f'Enqueued {self.entry.title}'
        embed.url = self.entry.url
        embed.add_field(name='Duration', value=utils.human_time(self.entry.duration))
        if self.progress:
            embed.title = f'Currently playing {self.entry.title}'
            embed.add_field(name='Progress', value=utils.human_time(self.progress))
            embed.add_field(name='Requester', value=self.requester, inline=False)
            embed.add_field(name='Skips', value=f'{len(self.skip_votes)}/{self.required_skips}')

        return embed


class VoiceQueue:
    def __init__(self, bot, guild):
        self.bot = bot
        self.guild = guild
        self.play_next_song = asyncio.Event()
        self.songs = utils.Playlist()
        self.audio_player = self.bot.loop.create_task(self.audio_player_task())

    async def audio_player_task(self):
        while True:
            self.play_next_song.clear()
            source = await self.songs.get()
            await source.start()
            embed = source.embed()
            embed.title = f'Now playing {source.entry.title}'
            embed.add_field(name='Requester', value=source.requester, inline=False)
            await source.channel.send(embed=embed)
            self.guild.voice_client.play(source, after=lambda x: self.play_next_song.set())
            await self.play_next_song.wait()


class Music:
    def __init__(self, bot):
        self.bot = bot
        self.queues = {}

    def get_queue(self, guild):
        queue = self.queues.get(guild.id)

        if queue is None:
            queue = VoiceQueue(self.bot, guild)
            self.queues[guild.id] = queue

        return queue

    def __unload(self):
        for queue in self.queues.values():
            try:
                queue.audio_player.cancel()
                self.bot.loop.create_task(queue.guild.voice_client.disconnect())
            except:
                pass

    async def on_voice_state_update(self, member, before, after):
        vc = member.guild.voice_client
        if vc is None:
            return

        if not vc.is_playing() and not vc.is_paused():
            return

        channel = vc.channel
        before_channel = before.channel
        after_channel = after.channel

        if channel != before_channel and channel != after_channel:
            return

        members = len(channel.members) - 1

        if members == 0:
            vc.pause()
        else:
            vc.resume()

    @commands.command(name='join')
    async def _join(self, ctx, *, channel: discord.VoiceChannel):
        """Joins a voice channel."""
        if ctx.author.voice is None:
            return await ctx.send('You need to be in a voice channel.')
        vc = ctx.guild.voice_client
        if vc is not None:
            return await ctx.send('Already in a voice channel.')

        await channel.connect()
        await ctx.send(f'Connected to {channel.name}.')

    @commands.command()
    async def summon(self, ctx):
        """Summons the bot to join your voice channel."""
        voice = ctx.author.voice
        if voice is None:
            await ctx.send('You are not in a voice channel.')
            return

        vc = ctx.guild.voice_client
        if vc is not None:
            await vc.move_to(voice.channel)
        else:
            return await voice.channel.connect()

    @commands.command()
    @utils.mod_or_permissions(manage_guild=True)
    async def stop(self, ctx):
        """Stops playing audio and leaves the voice channel.

        This also clears the queue.
        """
        vc = ctx.guild.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        queue = self.get_queue(ctx.guild)
        queue.audio_player.cancel()
        del self.queues[ctx.guild.id]

        await vc.disconnect()
        await ctx.send('Disconnected.')

    @commands.command()
    async def skip(self, ctx):
        """Vote to skip a song.

        The song requester can automatically skip.

        Approximately 1/3 of the members in the voice channel
        are required to vote to skip for the song to be skipped.
        """
        if ctx.author.voice is None:
            return await ctx.send('You need to be in a voice channel.')
        vc = ctx.guild.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        if not vc.is_playing() and not vc.is_paused():
            return await ctx.send('Not currently playing anything.')

        voter = ctx.author
        if voter == vc.source.requester:
            await ctx.send('Requester requested skipping song...')
            vc.stop()
        elif voter not in vc.source.skip_votes:
            vc.source.skip_votes.add(voter.id)
            votes = len(vc.source.skip_votes)

            if votes >= vc.source.required_skips:
                await ctx.send('Skip vote passed, skipping song...')
                vc.stop()
            else:
                await ctx.send(f'Skip vote added, currently at [{votes}/{vc.source.required_skips}]')
        else:
            await ctx.send('You have already voted to skip this song.')

    @commands.command()
    @utils.mod_or_permissions(manage_guild=True)
    async def pause(self, ctx):
        """Pauses the currently playing song."""
        vc = ctx.guild.voice_client
        if vc is None:
            return

        if vc.is_playing():
            vc.pause()

    @commands.command()
    @utils.mod_or_permissions(manage_guild=True)
    async def resume(self, ctx):
        """Resumes the currently playing song."""
        vc = ctx.guild.voice_client
        if vc is None:
            return

        if vc.is_paused():
            vc.resume()

    @commands.command()
    async def volume(self, ctx, value: int = None):
        """Sets the volume of the currently playing song."""

        vc = ctx.voice_client
        if vc is None:
            return await ctx.send('Not currently in a voice channel.')

        if vc.is_playing() or vc.is_paused():
            if value is not None:
                try:
                    utils.role_or_permissions(ctx, 'Admin', manage_guild=True)
                except commands.MissingPermissions as e:
                    await ctx.send(f'```\n{e}\n```')
                else:
                    vc.source.volume = value / 100
                    await ctx.send(f'Volume has been set to {vc.source.volume:.0%}.')
            else:
                await ctx.send(f'Volume is set to {vc.source.volume:.0%}.')
        else:
            await ctx.send('Not currently playing anything.')

    @commands.command()
    async def play(self, ctx, *, query: str):
        """Plays a song.

        If there is a song currently in the queue, then it is
        queued until the next song is done playing.

        This command automatically searches as well from YouTube.
        The list of supported sites can be found here:
        https://rg3.github.io/youtube-dl/supportedsites.html
        """
        if ctx.author.voice is None:
            return await ctx.send('You need to be in a voice channel.')
        vc = ctx.guild.voice_client
        if vc is None:
            vc = await ctx.invoke(self.summon)
            if vc is None:
                return

        try:
            source = await YTDLSource.from_url(ctx, query)
        except youtube_dl.DownloadError as e:
            return await ctx.send(e)
        embed = source.embed()
        queue = self.get_queue(ctx.guild)
        if not vc.is_playing() and not vc.is_paused():
            time_until = 'Up next!'
        else:
            length = queue.songs.duration + vc.source.remaining
            time_until = utils.human_time(length)
        embed.add_field(name='Time until playing', value=time_until)
        await ctx.send(embed=embed)
        await queue.songs.put(source)

    @commands.command()
    async def playlist(self, ctx, *, link: str):
        """Adds tracks from a playlist to the queue."""
        if ctx.author.voice is None:
            return await ctx.send('You need to be in a voice channel.')
        vc = ctx.guild.voice_client
        if vc is None:
            vc = await ctx.invoke(self.summon)

        info = await downloader.safe_extract_info(link, download=False, process=False)

        if 'entries' not in info:
            return await ctx.send('This is not a playlist')

        queue = self.get_queue(ctx.guild)

        bad_entries = 0
        for entry in info['entries']:
            try:
                source = await YTDLSource.from_url(ctx.message, entry.get('url'))
                await queue.songs.put(source)
            except Exception:
                bad_entries += 1

        if bad_entries:
            await ctx.send(f'Added {len(info["entries"]) - bad_entries} songs to the queue. {bad_entries} songs couldn\'t be added.')
        else:
            await ctx.send(f'Added {len(info["entries"])} songs to the queue.')

    @commands.command()
    async def playing(self, ctx):
        """Shows info about the currently playing song."""
        vc = ctx.guild.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        if not vc.is_playing() and not vc.is_paused():
            return await ctx.send('Not currently playing anything.')

        await ctx.send(embed=vc.source.embed())

    @commands.command()
    async def wheresmysong(self, ctx):
        """Shows how long until your next song will play."""
        vc = ctx.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        if not vc.is_playing() and not vc.is_paused():
            return await ctx.send('Not playing any music right now...')

        songs = self.get_queue(ctx.guild).songs
        if not songs._queue:
            return await ctx.send('Nothing currently in the queue.')

        if ctx.author not in songs.requesters:
            return await ctx.send('You are not in the queue!')

        remaining = vc.source.remaining

        for song in songs:
            if song.requester == ctx.author:
                break
            remaining += song.length

        await ctx.send(f'{utils.human_time(remaining)} until your next song!')

    @commands.command()
    async def queue(self, ctx):
        """Shows the current queue."""
        vc = ctx.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        if not vc.is_playing() and not vc.is_paused():
            return await ctx.send('Not currently playing anything.')

        queue = self.get_queue(ctx.guild).songs

        if len(queue) == 0:
            return await ctx.invoke(self.playing)
        songs = [f'[{song.entry.title}]({song.entry.url})\nRequested by {song.requester}' for song in queue]
        try:
            paginator = utils.EmbedPaginator(ctx, entries=songs, per_page=10)
            paginator.embed.colour = 0x738bd7
            paginator.embed.title = f'Currently Playing {vc.source.entry.title} requested by {vc.source.requester}'
            paginator.embed.url = vc.source.entry.url
            await paginator.paginate()
        except Exception as e:
            await ctx.send(e)

    @commands.command()
    async def shuffle(self, ctx):
        """Shuffles the current queue."""

        vc = ctx.voice_client
        if vc is None:
            return await ctx.send('Not in a voice channel.')

        queue = self.get_queue(ctx.guild).songs

        if len(queue) == 0:
            return await ctx.send('No songs in the queue.')

        queue.shuffle()
        await ctx.send('The queue has been shuffled.')


def setup(bot):
    bot.add_cog(Music(bot))
