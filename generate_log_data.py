import random
from datetime import timedelta
from datetime import datetime

countries = ["US","US","IN","IN","HU","NL","NL","FR","DE","DE"]
sources = ["organic","organic","organic",   "organic", "organic", "organic", "sem", "sem", "display", "blog"]
d = datetime.strptime('08012015', "%d%m%Y")
userid = 123
pl=False

for i in xrange(0,100000):
    if not pl or random.randint(1,10) > 1:
        d = d + timedelta(seconds=1)
        pl = True
        userid += 1
        c = countries[random.randint(0,len(countries)-1)]
        s = sources[random.randint(0,len(sources)-1)]
        print d.strftime('%Y-%m-%d %H:%M:%S') + " registration " + str(userid) + " " + s
    else:
        pl = False
        if random.randint(1,2) == 1:
            amount = 99
        else:
            amount = 59
        
        print d.strftime('%Y-%m-%d %H:%M:%S') + " payment " + str(userid) + " " + c + " " + str(amount)
