log = LOAD 'web.log' USING PigStorage(' ') 
      AS (date:chararray, time:chararray, action:chararray,
      	  email:chararray, country:chararray, amount:int);
payments = FILTER log BY action == 'payment';

satisfaction = LOAD 'satisfaction.txt' USING PigStorage(' ') AS (email:chararray, score:int);

d = JOIN payments BY email, satisfaction BY email;
countryscores = FOREACH d GENERATE payments::country as country, satisfaction::score as score;
g = GROUP countryscores BY country;

avg_scores = FOREACH g GENERATE group as country, AVG(countryscores.score) as avg_score;
happy_scores = FILTER avg_scores BY avg_score >= 75;
o = ORDER happy_scores BY avg_score DESC;

DUMP o;
