payments = LOAD 'payments.csv' USING PigStorage(',') AS (date:datetime, user_id:int, amount:long);

g = GROUP payments BY user_id;
sum_payments = FOREACH g GENERATE group as user_id, SUM(payments.amount) AS total_payments;

DUMP sum_payments;