import random
import asyncio


class Playlist(asyncio.Queue):
    def __iter__(self):
        return iter(self._queue)

    def __len__(self):
        return len(self._queue)

    def shuffle(self):
        random.shuffle(self._queue)

    def clear(self):
        self._queue.clear()

    @property
    def duration(self):
        return sum(entry.length for entry in self)

    @property
    def requesters(self):
        return {entry.requester for entry in self}
