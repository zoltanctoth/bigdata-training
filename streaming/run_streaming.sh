hadoop jar streaming.jar -input birdstrikes.csv -output counts.txt -mapper mapper.sh -reducer reducer.py -numReduceTasks 10 -file mapper.sh -file reducer.py
