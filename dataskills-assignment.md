# Assignment for the Data Skills class

## Preparations:
Make sure you execute this command in the terminal before proceeding:
```
cd training
git pull
```
This will make sure you have the current version of the training material.

## 1. UNIX: Count transactions by card types:
You will find a file on the virtual machine, in your home: ```training/datasets/payments.csv```
Check out the contents of this file. The columns of these file are: *date, user_id, amount_payed, card_type*. 

Answer the following business question: How many transactions can we see by card type on 2015-07-11?
The output of your command will be most probasbly similar to this:
```
     39 AMEX
     87 MasterCard
    103 Visa
```
**Assignment outcome:** The command you executed to get to your results.

## 2. SQL: Which are the states with the smallest average costs?
*Hint: If you haven't loaded your data into the SQL server yet (i.e. you use your own computer for the assignment), you can create the birdstrikes table and load the data automatically by executing this command:*
```
cd training/sql
./setup
```

Answer the following business question:
Which are the states with the least average cost? Only take those states in consideration where the average cost is bigger than 0. Only show the first 3 results by average cost ascending.

Your result will be something like that:
```
      state       |         avg          
------------------+----------------------
 Virgin Islands   |   1.2500000000000000
 British Columbia |  58.2619047619047619
 Rhode Island     | 119.4129930394431555
(3 rows)
```
**Assignment outcome:** The SQL command you executed to get to your results.

## 3 Python: Decide if numbers are negative or positive

1. Create a function (call it ```sgn```) which takes a number and returns ```-1``` if the number is negative, ```1``` if the number is positive and ```0``` for 0.
2. Create this list: ```l = [-10,10,5,0,-5]```
3. Loop through this list and for each number in this list print the number and its ```sgn``` in this form: ```The signum value of <the number> is <sgn value of the number>.```. This means your output should look something like this:

**Assignment outcome:** A screenshot of your jupyter notebook with your code and output.


