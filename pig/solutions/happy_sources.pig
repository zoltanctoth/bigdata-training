log = LOAD 'web.log' USING PigStorage(' ') 
    AS (date:chararray, time:chararray, action:chararray, 
    	source:chararray, email:chararray,ip:chararray);

registrations = FILTER log BY action == 'registration';

satisfaction = LOAD 'satisfaction.txt' USING PigStorage(' ') AS (email:chararray, score:int);

d = JOIN registrations BY email, satisfaction BY email;
sourcescores = FOREACH d GENERATE registrations::source as source, satisfaction::score as score;

g = GROUP sourcescores BY source;
avg_scores = FOREACH g GENERATE group as source, AVG(sourcescores.score) as avg_score;
happy_scores = FILTER avg_scores BY avg_score >= 75;
o = ORDER happy_scores BY avg_score DESC;

DUMP o;
