#Excercises

#### skeleton

Write a `read_group()` python function, which can be used in the
reducer to transform the input stream into `key -> [value1, value2, ...]` pairs.

*This will make your job much easier later.*

#### sum_by_userid
Write a mapper/reducer python script that emits the total purchace of each userid (along with the user id).

#### first date of purchase
Write a mapper/reducer python script that emits the user_id and the first date the user issued a purchase for each user.

#### sum_by_userid_w_region
Get the `sum_by_userid` script have the region of each user on it's
output.

Hints:
1. You will need to JOIN. You can't join with `cat | map | sort | reduce` as it only accepts one stream, so you'll need to use the hadoop streaming api in local mode, which will be something like this:

  `hadoop jar /usr/local/Cellar/hadoop/2.6.0/libexec/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar -fs local -jt local -mapper mapper.py -reducer reducer.py -input payments.csv users.csv -output out.csv -file mapper.py -file reducer.py`

2. When you use multiple file inputs, you can get the filename of the actual stream in the mapper from `os.environ["map_input_file"]`

3. You can user super simple commands as mapper/reducer for debugging the streaming api. I.e.: `-mapper env -reducer cat` will simply emit
the environment vars your script it running (and sort it of course :) )

#### +1
Write a combiner function for `sum_by_userid_w_region`
