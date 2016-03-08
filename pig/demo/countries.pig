log = LOAD 'web.log' USING PigStorage(' ') AS (date:chararray, time:chararray,action:chararray,email:chararray,country:chararray,amount:int);
payments = FILTER log BY action == 'payment';
country_only = FOREACH payments GENERATE country;
countries = DISTINCT country_only;
DUMP countries;
