````
# Open a terminal, start Hadoop:
start-all.sh
start-historyserver.sh

# Check what we on the filesystem:
hadoop fs -ls /
hadoop fs -ls /user
hadoop fs -ls /user/bigdata

# Again, what do we have in our home? (/user/bigdata)
hadoop fs -ls

# Free space and other information:
hadoop dfsadmin -report

# Get the birdstrikes.csv from HDFS and put it into b.csv
hadoop fs -get birdstrikes.csv b.csv

# Check the file. It has no header. Why? Because when mapreduce apps would
# split this file, the header would only be in one of the splits.
# It is the same reason that there is no zip compression on hadoop (the decompression data)

# Put data to HDFS
hadoop fs -put b.csv birdstrikes.csv
# Will not work, as there is no overwrite!
# Give it a new name:
hadoop fs -put b.csv b.csv

# Create a directory
hadoop fs -mkdir birdstrikes

# Check it
hadoop fs -ls
hadoop fs -ls birdstrikes

# Copy in hdfs
hadoop fs -cp birdstrikes.csv birdstrikes
# What happens at copying?
# What happens at moving (mv)? No data movement, it's a simply change in the namenode

# Remove a directory
hadoop fs -rm -r birdstrikes

# Remove the local file
rm birdstrikes.csv

# Excercise:
# Get the birdstrikes.csv. get the 5 lines and put it into top5.csv
# create a top5 directory
# hadoop put top5.csv into it
# Solution
hadoop fs -get birdstrikes.csv birdstrikes.csv
head -n 5 birdstrikes.csv > top5.csv
hadoop mkdir top5.csv
hadoop put top5.csv top5/top5.csv
````
