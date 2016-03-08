
log = LOAD 'web.log' USING PigStorage(' ') 
      AS (date:chararray, time:chararray, action:chararray,
      	  email:chararray, country:chararray, amount:int);

payments = FILTER log BY action == 'payment';
g = GROUP payments BY country;

payment_stat = FOREACH g GENERATE group as country,
    COUNT(payments) as cnt, SUM(payments.amount) as total_payments;

DUMP payment_stat;
STORE payment_stat INTO 'payment_stat.csv' USING PigStorage(',');

