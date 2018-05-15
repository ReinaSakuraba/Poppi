import asyncio
from concurrent.futures import ThreadPoolExecutor


__all__ = ('run_subprocess', 'run_in_executor', 'CaseInsensitiveDict')


async def run_subprocess(cmd):
    pipe = asyncio.subprocess.PIPE
    func = asyncio.create_subprocess_shell
    process = await func(cmd, stdout=pipe, stderr=pipe)

    result = await process.communicate()
    return [x.decode('utf-8') for x in result]


async def run_in_executor(func, *, executor=None, loop=None):
    executor = executor or ThreadPoolExecutor(max_workers=4)
    loop = loop or asyncio.get_event_loop()

    future = executor.submit(func)
    future = asyncio.wrap_future(future)

    result = await asyncio.wait_for(future, timeout=None, loop=loop)

    return result


class CaseInsensitiveDict(dict):
    def __contains__(self, k):
        return super().__contains__(k.lower())

    def __delitem__(self, k):
        return super().__delitem__(k.lower())

    def __getitem__(self, k):
        return super().__getitem__(k.lower())

    def get(self, k, default=None):
        return super().get(k.lower(), default)

    def __setitem__(self, k, v):
        super().__setitem__(k.lower(), v)
