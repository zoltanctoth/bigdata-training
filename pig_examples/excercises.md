# Pig Excercises

### Files
**payments.csv** - Stores all payment data. No header.

CSV Format:

| date | user_id | amount |
|------|---------|--------|
|date of the payment YYYY-MM-DD|positive integer|amount payed {50,100,150,200}

**users.csv** - Stores user attritbutes. No header.

CSV Format:

| user_id | city |
|------|---------|--------|
|positive integer|string, max length=10|


### Excercises

#### sum_by_userid.pig
Tell the total amount of money paid by each user

#### day_with_the_most_income.pig
Which were the top 5 day regarding our income? Also display the amount for each day.

#### total_payments_by_city.pig
Tell the total amount of money paid by users living in each city

####  first_amount_paid_by_user.pig
Get the first payment for each user and display the userid and the amount paid.

#### this one goes for the real men - paying_users_by_region:
How many paying users there are by Region?

*(Region := Megye. Write a Jython UDF that maps cities to regions)*
