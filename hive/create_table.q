CREATE EXTERNAL table bs2 
(
    id INT,
    aircraft STRING,
    state STRING,
    size STRING,
    cost INT
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' STORED AS TEXTFILE
LOCATION '/user/zoltanctoth/birdstrikes';
