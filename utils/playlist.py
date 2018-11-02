import random
import asyncio
import itertools
from collections import defaultdict, deque
from typing import Set

import discord


class Playlist(asyncio.Queue):
    def __iter__(self):
        return iter(self._queue)

    def __len__(self):
        return len(self._queue)

    def shuffle(self):
        entries = defaultdict(list)

        for entry in self:
            entries[entry.requester.id].append(entry)

        for requester_entries in entries.values():
            entry_length = len(requester_entries)

            random.shuffle(requester_entries)

            if entry_length == 1:
                requester_entries[0].position = random.random()
            else:
                for i, entry in enumerate(requester_entries, 1):
                    entry.position = 1 / (entry_length + 1) * i + random.random() / 10 - 0.05

        shuffled = sorted(itertools.chain(*entries.values()), key=lambda x: x.position)

        for entry in shuffled:
            del entry.position

        self._queue = deque(shuffled)

    def true_shuffle(self):
        random.shuffle(self._queue)

    def clear(self):
        self._queue.clear()

    @property
    def duration(self) -> int:
        return sum(entry.length for entry in self)

    @property
    def requesters(self) -> Set[discord.Member]:
        return {entry.requester for entry in self}
