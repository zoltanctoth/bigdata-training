#!/usr/bin/env python

import sys

for line in sys.stdin:
    line = line.rstrip('\n')

    d = line.split(",")
    date = d[0]
    user_id = d[1]

    print user_id + "\t" + date
