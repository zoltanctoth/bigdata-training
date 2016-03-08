log = LOAD 'web.log' USING PigStorage(' ') 
    AS (date:chararray, time:chararray, action:chararray, 
    	source:chararray, email:chararray,ip:chararray);

registrations = FILTER log BY action == 'registration';
g = GROUP registrations BY source;

reg_stat = FOREACH g GENERATE group as source,
    COUNT(registrations) as cnt;

DUMP reg_stat;
STORE reg_stat INTO 'reg_stat.csv' USING PigStorage(',');
