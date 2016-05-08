import random

cities = ["Budapest", "Budapest", "Budapest", "Debrecen", "Debrecen", "Sopron", "Gyor"]
random.seed(288)

# print "user_id,city"
for user_id in range(1, 100000):
    city = cities[random.randint(0, len(cities) - 1)]
    print "%d,%s" % (user_id, city)
