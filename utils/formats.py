import datetime

from dateutil.relativedelta import relativedelta


__all__ = ('plural', 'human_join', 'human_time', 'human_timedelta')


def plural(name, value, *, ending='s'):
    return f'{value} {name}{ending * (value != 1)}'


def human_join(seq, *, delim=', ', final='and', oxford=True):
    if not seq:
        return ''

    if len(seq) > 2:
        return f'{delim.join(seq[:-1])}{delim.strip() * oxford}{final:>{len(final) + 1}} {seq[-1]}'
    return f' {final} '.join(seq)


def human_time(seconds):
    seconds = int(seconds)
    if seconds == 0:
        return '0 seconds'

    is_negative = seconds < 0

    now = datetime.datetime.utcnow()
    future = now + datetime.timedelta(seconds=abs(seconds))
    delta = relativedelta(future, now)

    weeks, days = divmod(delta.days, 7)

    units = (
        ('year', delta.years),
        ('month', delta.months),
        ('week', weeks),
        ('day', days),
        ('hour', delta.hours),
        ('minute', delta.minutes),
        ('second', delta.seconds)
    )

    time = [plural(unit, value) for unit, value in units if value]
    formatted_time = human_join(time)
    return formatted_time + ' ago' * is_negative


def human_timedelta(dt, *, source=None):
    now = source or datetime.datetime.utcnow()
    delta = dt - now
    return human_time(delta.total_seconds())
