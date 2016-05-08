import random
import sys
import datetime
from datetime import timedelta

random.seed(2888)
date = datetime.date(2015, 1, 1)
# print "date,user_id,amount"
while True:
    user_id = random.randint(1, 100000)
    payment = random.randint(1, 4) * 50

    if random.randint(0, 30000) == 0:
        date = date + timedelta(days=1)
    if date >= datetime.date.today():
        sys.exit(0)

    print "%s,%d,%d" % (date, user_id, payment)
