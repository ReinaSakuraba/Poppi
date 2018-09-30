import asyncio
from concurrent.futures import ThreadPoolExecutor

from .paginator import EmbedPaginator
from .context import Context


__all__ = ('run_subprocess', 'run_in_executor', 'CaseInsensitiveDict', 'search_entries', 'all_entries')


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


async def search_entries(ctx: Context, schema: str, name: str, *table_names: str, type_name: str):
    base_query = """
                 SELECT name, SIMILARITY(name, $1)
                 FROM {0}.{1}
                 WHERE name % $1
                 """

    formatted_query = "UNION".join(base_query.format(schema, table_name) for table_name in table_names)

    query = f"""
            SELECT DISTINCT name, similarity
            FROM (
                {formatted_query}
            ) AS a
            ORDER BY similarity DESC;
            """

    results = [f'{index}: {name}' for index, (name, _) in enumerate(await ctx.pool.fetch(query, name), 1)]

    if not results:
        return await ctx.send(f'{type_name} not found.')

    try:
        paginator = EmbedPaginator(ctx, entries=results, per_page=15)
        paginator.embed.colour = 0x738bd7
        await paginator.paginate()
    except Exception as e:
        await ctx.send(e)


async def all_entries(ctx: Context, schema: str, *table_names: str):
    base_query = """
                 SELECT name
                 FROM {0}.{1}
                 """

    formatted_query = "UNION".join(base_query.format(schema, table_name) for table_name in table_names)

    query = f"""
            SELECT DISTINCT name
            FROM (
                {formatted_query}
            ) AS a
            ORDER BY name;
            """

    results = [f'{index}: {name}' for index, (name,) in enumerate(await ctx.pool.fetch(query), 1)]

    try:
        paginator = EmbedPaginator(ctx, entries=results, per_page=15)
        paginator.embed.colour = 0x738bd7
        await paginator.paginate()
    except Exception as e:
        await ctx.send(e)
