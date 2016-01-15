#!/bin/bash -e

rm -rf out.csv

hadoop jar /usr/local/Cellar/hadoop/2.6.0/libexec/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar -fs local -jt local -mapper mapper.py -reducer reducer.py -input payments.csv users.csv -output out.csv -file mapper.py -file reducer.py
