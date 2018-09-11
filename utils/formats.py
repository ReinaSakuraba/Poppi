import datetime

from dateutil.relativedelta import relativedelta


__all__ = ('plural', 'human_join', 'human_time', 'human_timedelta', 'digital_time', 'TabularData')


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


def digital_time(seconds):
    return f'{seconds//3600:02}:' * (seconds >= 3600) + f'{seconds%3600//60:02}:{seconds%60:02}'


class TabularData:
    def __init__(self):
        self._widths = []
        self._columns = []
        self._rows = []

    def set_columns(self, columns):
        self._columns = columns
        self._widths = [len(c) + 2 for c in columns]

    def add_row(self, row):
        rows = [str(r) for r in row]
        self._rows.append(rows)
        for index, element in enumerate(rows):
            width = len(element) + 2
            if width > self._widths[index]:
                self._widths[index] = width

    def add_rows(self, rows):
        for row in rows:
            self.add_row(row)

    def render(self):
        sep = '+'.join('-' * w for w in self._widths)
        sep = f'+{sep}+'

        to_draw = [sep]

        def get_entry(d):
            elem = '|'.join(f'{e:^{self._widths[i]}}' for i, e in enumerate(d))
            return f'|{elem}|'

        to_draw.append(get_entry(self._columns))
        to_draw.append(sep)

        for row in self._rows:
            to_draw.append(get_entry(row))

        to_draw.append(sep)
        return '\n'.join(to_draw)
