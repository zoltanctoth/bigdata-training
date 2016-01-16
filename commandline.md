# Command line data excercises

1. `mkdir` `cd` `TAB` `CTRL+L` -
Create a directory called `training` and step into it.
```
mkdir training
cd training
```

* `cd ..` `cp` -
Copy the `birdstrikes.csv` into the training directory.
```
cd ..
cp birdstrikes.csv training
cd training
```

* `cat` -
Print the file to the screen.
```
cat birdstrikes.csv
```

* `less` -
Explore the csv
```
less birdstrkes.csv
```

* `head` -
Print the first 20 lines to the file to the screen
```
head -n 20 birdstrikes.csv
```
* `man` -
What is `-n`? Check it in the manual
```
man head
```

* `tail` -
Check the last 10 lines of the file
```
tail -n 10 birdstrikes.csv
```

* *Excercise*:
check last line of the file
```
tail -n 1 birdstrikes.csv
```

* `>` -
Put the first 10 lines into an other file
```
head -n 10 birdstrikes.csv > first10.csv
```

* *Excercise*:
show the 10th line of the csv.
```
tail -1 first10.csv
```

* *Excercise*: show the 5th line of the csv.
```
head -n 5 birdstrikes.csv > first5.csv
tail -1 first5.csv
```

* `|` -
we can do this with 1 command
```
head -n 5 birdstrikes.csv | tail -n 1
```

* *Excercise*:
put the 5th line into the 5thline.csv
```
head -n 5 birdstrikes.csv | tail -n 1 > 5thline.csv
```

* `grep` -
Only show incidents from California
```
grep birdstrikes.csv | grep Airplane
```
* `grep` -
Only show incidents NOT with Airplanes
```
grep birdstrikes.csv | grep -v Airplane
```

* *Excercise*:
show the first 3 Helicopter incidents NOT in Colorado
```
cat birdstrikes.csv | grep Helicopter | grep -v Colorado | head -3
```

* `wc` -
show the line, word and character count of birdstrikes
```
wc birdstrikes.csv
```

* *Excercise*:
show the word, line and character count of the first 10 lines
```
head -n 10 birdstrikes.csv | wc
```

* *Excercise*:
how many incidents were in California (only output line count)
```
cat birdstrikes.csv | grep California | wc -l
```

* `cut` -
Display only the *aircraft* and the *flight_date* columns
```
cat birdstrikes.csv | cut -d, -f2,3
```

* *Excercise*:
display only the *state* and the *bird_size* columns of Airplane accidents
```
cat birdstrikes.csv | grep Airplane | cut -d, -f5,8
```

* *Excercise*:
How many incidents happened that were $>0
```
cat birdstrikes.csv | cut -d, -f10 | grep -v '^0$' | wc -l
```

* `sort` -
Sort this file
```
sort birdstrikes.csv
```

* `sort -k -t` -
Sort by feet above ground
```
sort -t11 -k, | less
```

* *Excercise*:
Which was the most expensive incident?
```
sort -t10 -k, | tail -1
```

* *Excercise*:
In which Area did the most expensive incident happen that was caused by a Small bird?
```
sort -t10, -k, | grep Small | cut -f, -d6
```

* `sort | uniq` -
What kind of bird sizes are there?
```
cat birdstrikes.csv | cut -d, -f9 | sort | uniq
```

* *Excercise*:
In how many states did accidents happen?
```
cat birdstrikes.csv | cut -d, -f6 | sort | uniq | wc -l
```

* `uniq -c` -
How many incidents were there by state?
```
cat birdstrikes.csv | cut -d, -f6 | sort | uniq -c
```

* *Excercise*:
How many incidents were there by Airlines. Output should be sorted by airline
```
cat birdstrikes.csv | cut -d, -f5 | sort | uniq -c | sort -k' ' -t2
```

* `mcedit` -
The whole thing works with scripts too.
```
mcedit groupcount
sort | uniq -c
chmod 755 groupcount
```

* `awk` -
Sum costs
```
cat birdstrikes.csv | cut -d, -f10 | awk 'BEGIN { s=0; } { s = s + $1; } END {print s; }'
```

* *Excercise* -
Get the number of lines with awk
```
cat birdstrikes.csv | awk 'BEGIN { s=0; } { s = s + 1 } END {print s; }'
```

* `awk` -
Demo:
```
cat birdstrikes.csv | cut -d, -f5,10 | sed 1d | sort -t, | awk -F, 'BEGIN { last="";sum=0; } { if (last != $1){ if (last != ""){ print last","sum;} last = $1;sum=0;} sum = sum + $2} END{print last","sum;}'
```
