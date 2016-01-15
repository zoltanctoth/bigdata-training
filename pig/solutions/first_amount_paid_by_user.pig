payments = LOAD 'payments.csv' USING PigStorage(',') AS (date:datetime, user_id:int, amount:long);

g = GROUP payments BY date;
first_payments = FOREACH g {
    ordered = ORDER payments BY date;
    l = LIMIT ordered 1;
    GENERATE FLATTEN(l.user_id) as user_id, FLATTEN(l.amount) as amount;
    }

o = order first_payments by user_id;
DUMP o;