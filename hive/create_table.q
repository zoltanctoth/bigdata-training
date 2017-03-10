CREATE EXTERNAL table birdstrikes 
(
    id INT,
    aircraft STRING,
    state STRING,
    cost INT
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' STORED AS TEXTFILE
LOCATION 's3://zoltanctoth/bs';
