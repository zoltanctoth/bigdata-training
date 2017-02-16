import random

cities = ["Budapest", "Budapest", "Budapest", "Amsterdam", "Amsterdam", "Sopron", "Vienna"]
random.seed(288)

print "user_id,city,age"
for user_id in range(1, 600000):
    city = cities[random.randint(0, len(cities) - 1)]
    age = random.randint(19,75)
    print "%d,%s,%d" % (user_id, city, age)
