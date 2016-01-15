REGISTER 'utils.py' USING jython as utils;

payments = LOAD 'payments.csv' USING PigStorage(',') AS (date:datetime, user_id:int, amount:long);
users = LOAD 'users.csv' USING PigStorage(',') AS (user_id:int, city:chararray);

j = JOIN payments BY user_id, users BY user_id USING 'replicated';
users_with_region = FOREACH j GENERATE utils.get_region(users::city) as region, payments::user_id as user_id;

g = GROUP users_with_region BY region;
paying_users_by_region = FOREACH g {
    d = DISTINCT users_with_region;
    GENERATE group as region, COUNT(d.user_id) AS users;
    }
o = ORDER paying_users_by_region BY users DESC;
DUMP o;
