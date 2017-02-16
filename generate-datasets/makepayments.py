import random
import sys
import datetime
from datetime import timedelta

random.seed(2888)
date = datetime.date(2017, 1, 1)

print "date,user_id,amount,card"
while True:
    user_id = random.randint(1, 600000)
    payment = random.randint(1, 4) * 50
    card = ["MasterCard","Visa","AMEX"][random.randint(0,2)]

    if random.randint(0, 30000) == 0:
        date = date + timedelta(days=1)
    if date >= datetime.date.today():
        sys.exit(0)

    print "%s,%d,%d,%s" % (date, user_id, payment, card)
