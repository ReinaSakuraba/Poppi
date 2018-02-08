import asyncio
import functools
from concurrent.futures import ThreadPoolExecutor

import youtube_dl


class Downloader:
    opts = {
        'format': 'webm[abr>0]/bestaudio/best',
        'quiet': True,
        'default_search': 'auto',
        'noplaylist': True,
    }
    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

        self.executor = ThreadPoolExecutor(max_workers=2)
        self.ytdl = youtube_dl.YoutubeDL(self.opts)
        self.safe_ytdl = youtube_dl.YoutubeDL(self.opts)
        self.safe_ytdl.params['ignoreerrors'] = True

    async def extract_info(self, *args, **kwargs):
        func = functools.partial(self.ytdl.extract_info, *args, **kwargs)
        return await self.loop.run_in_executor(self.executor, func)

    async def safe_extract_info(self, *args, **kwargs):
        func = functools.partial(self.safe_ytdl.extract_info, *args, **kwargs)
        return await self.loop.run_in_executor(self.executor, func)
