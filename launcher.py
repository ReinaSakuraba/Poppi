import asyncio

import click
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

            CREATE TABLE starboards (
                guild_id BIGINT PRIMARY KEY,
                channel_id BIGINT NOT NULL,
                threshold SMALLINT DEFAULT 1
            );

            CREATE TABLE starboard_entries (
                message_id BIGINT PRIMARY KEY,
                bot_message_id BIGINT,
                channel_id BIGINT NOT NULL,
                author_id BIGINT NOT NULL,
                guild_id BIGINT NOT NULL REFERENCES starboards(guild_id) ON DELETE CASCADE
            );

            CREATE TABLE starrers (
                author_id BIGINT,
                message_id BIGINT REFERENCES starboard_entries(message_id) ON DELETE CASCADE,
                PRIMARY KEY (author_id, message_id)
            );

            CREATE TABLE IF NOT EXISTS bank (
                user_id BIGINT PRIMARY KEY,
                amount BIGINT DEFAULT 0
            );

            CREATE TABLE IF NOT EXISTS shop (
                item TEXT PRIMARY KEY,
                price INT NOT NULL
            );

            INSERT INTO shop (
                item,
                price
            ) VALUES
                ('Common Core Crystal', 500),
                ('Rare Core Crystal', 5000),
                ('Legendary Core Crystal', 30000),
                ('Sheba''s Core Crystal', 500000)
            ON CONFLICT (item, price)
            DO UPDATE SET price = excluded.price;

            CREATE TABLE IF NOT EXISTS inventory (
                user_id BIGINT,
                item TEXT,
                amount INT NOT NULL,
                PRIMARY KEY(user_id, item)
            );
            CREATE TABLE IF NOT EXISTS pulled_blades (
                user_id BIGINT,
                blade TEXT,
                common BOOL NOT NULL,
                PRIMARY KEY(user_id, blade)
            );
            """
    await pool.execute(query)


def run_bot():
    loop = asyncio.get_event_loop()
    pool = loop.run_until_complete(asyncpg.create_pool(config.dsn, command_timeout=60))
    bot = Bot(pool=pool, loop=loop)
    bot.run(config.token)


@click.group(invoke_without_command=True)
@click.pass_context
def main(ctx):
    """Launches the bot."""

    if ctx.invoked_subcommand is None:
        run_bot()


@main.group()
def db():
    pass


@db.command()
def init():
    """Creates the database."""

    loop = asyncio.get_event_loop()
    pool = loop.run_until_complete(asyncpg.create_pool(config.dsn, command_timeout=60))
    loop.run_until_complete(create_db(pool))


if __name__ == '__main__':
    main()
