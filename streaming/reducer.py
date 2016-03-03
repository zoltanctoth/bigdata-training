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
        values.append(int(value))

    yield last_key, values


for key, values in read_group():
    avg_values = sum(values)/len(values)
    print "%s\t%s\t%s" % (key, avg_values, sum(values))
