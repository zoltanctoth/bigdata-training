#!/usr/bin/env python

import sys


def read_group():
    last_key = None
    values = []

    for line in sys.stdin:
        line = line.rstrip("\n")
        key, value = line.split("\t", 1)
        if last_key is not None and last_key != key:
            yield last_key, values
            values = []
        last_key = key
        values.append(value)

    yield last_key, values


for key, values in read_group():
    user_id = int(key)
    first_date = sorted(values)[0]
    print "%d,%s" % (user_id, first_date)
