hadoop jar streaming.jar -input birdstrikes.csv -output counts4 -mapper mapper.sh -reducer reducer.py -numReduceTasks 10 -file mapper.sh -file reducer.py
