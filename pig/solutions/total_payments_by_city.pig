payments = LOAD 'payments.csv' USING PigStorage(',') AS (date:datetime, user_id:int, amount:long);
users = LOAD 'users.csv' USING PigStorage(',') AS (user_id:int, city:chararray);

j = JOIN payments BY user_id, users BY user_id USING 'replicated';
payments_and_city = FOREACH j GENERATE users::city as city, payments::amount as amount;

g = GROUP payments_and_city BY city;
sum_payments = FOREACH g GENERATE group as city, SUM(payments_and_city.amount) AS total_payments;
DUMP sum_payments;
