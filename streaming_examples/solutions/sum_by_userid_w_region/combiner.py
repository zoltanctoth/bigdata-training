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

# if we encounter a "user" object, simply pass it through
# aggregate payments otherwise

for key, values in read_group():
    total_payment = 0
    user_id = key
    for v in values:
        data_type, payload = v.split('\t', 1)
        if data_type == "user":
            region = payload
            print "%s\tuser\t%s" % (user_id, region)
        elif data_type == "payment":
            total_payment += int(payload)

    print "%s\tpayment\t%d" % (user_id, total_payment)
