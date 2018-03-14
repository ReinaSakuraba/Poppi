import asyncio

import asyncpg

from bot import Bot
import config


async def create_db(pool):
    query = """
            CREATE TABLE IF NOT EXISTS commands (
                guild_id BIGINT,
                channel_id BIGINT,
                author_id BIGINT,
                used TIMESTAMP DEFAULT NOW(),
                prefix TEXT,
                command TEXT
            );

            CREATE INDEX IF NOT EXISTS commands_used_idx ON commands(used);

            CREATE TABLE IF NOT EXISTS plonks (
                id SERIAL,
                author_id BIGINT,
                guild_id BIGINT DEFAULT 0,
                PRIMARY KEY(author_id, guild_id)
            );

            CREATE INDEX IF NOT EXISTS plonks_guild_idx ON plonks(guild_id);

            CREATE TABLE IF NOT EXISTS reminders (
                id SERIAL,
                message TEXT,
                author_id BIGINT,
                channel_id BIGINT,
                created TIMESTAMP(0),
                expires TIMESTAMP(0)
            );

            CREATE TABLE IF NOT EXISTS tags (
                id SERIAL,
                name TEXT,
                location_id BIGINT,
                owner_id BIGINT,
                context TEXT,
                uses INT DEFAULT 0,
                created_at TIMESTAMP DEFAULT NOW(),
                PRIMARY KEY(name, location_id)
            );

            CREATE UNIQUE INDEX IF NOT EXISTS tags_unique_idx ON tags(LOWER(name), location_id);
            CREATE INDEX IF NOT EXISTS tags_name_idx ON tags(LOWER(name));
            CREATE INDEX IF NOT EXISTS tags_location_idx ON tags(location_id);
            CREATE INDEX IF NOT EXISTS tags_owner_idx ON TAGS(owner_id);
            CREATE INDEX IF NOT EXISTS tags_trgm_idx ON tags USING GIN (name gin_trgm_ops);

            CREATE TABLE IF NOT EXISTS profiles (
                id SERIAL,
                user_id BIGINT PRIMARY KEY,
                steam TEXT,
                nnid TEXT,
                fc_3ds TEXT,
                fc_switch TEXT,
                psn TEXT,
                other TEXT
            );

            CREATE TABLE IF NOT EXISTS announcements (
                id SERIAL,
                guild_id BIGINT PRIMARY KEY,
                channel_id BIGINT,
                log_channel_id BIGINT,
                greeting TEXT,
                farewell TEXT
            );
            """
    await pool.execute(query)


def main():
    loop = asyncio.get_event_loop()
    pool = loop.run_until_complete(asyncpg.create_pool(config.dsn, command_timeout=60))
    loop.run_until_complete(create_db(pool))
    bot = Bot(pool=pool, loop=loop)
    bot.run(config.token)


if __name__ == '__main__':
    main()
