#!/usr/bin/env python

import sys
import os


def get_region(city):
    if city == "Budapest":
        return "Budapest"
    elif city == "Debrecen":
        return "Hajdu-Bihar"
    elif city in ["Sopron", "Gyor"]:
        return "Gyor-Moson-Sopron"
    else:
        return None

for line in sys.stdin:
    line = line.rstrip('\n')
    d = line.split(",")

    filename = os.environ["map_input_file"].split("/")[-1]
    if filename == "users.csv":
        user_id = d[0]
        region = get_region(d[1])
        print "%s\tuser\t%s" % (user_id, region)
    elif filename == "payments.csv":
        date = d[0]
        user_id = d[1]
        amount = d[2]

        if date < "2015-01-01" or date >= "2015-05-01":
            continue

        print "%s\tpayment\t%s" % (user_id, amount)
    else:
        print >>sys.stderr, "Unexpected input file: %s" % filename
        exit(1)
