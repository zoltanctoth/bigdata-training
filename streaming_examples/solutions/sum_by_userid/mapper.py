#!/usr/bin/env python

import sys

for line in sys.stdin:
    line = line.rstrip('\n')

    d = line.split(",")
    user_id = d[1]
    payment = d[2]

    print user_id + "\t" + payment
