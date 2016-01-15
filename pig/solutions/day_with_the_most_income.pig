payments = LOAD 'payments.csv' USING PigStorage(',') AS (date:datetime, user_id:int, amount:long);

g = GROUP payments BY date;
sum_payments = FOREACH g GENERATE group as date, SUM(payments.amount) AS total_payments;
o = ORDER sum_payments BY total_payments DESC;
l = LIMIT o 5;
DUMP l;