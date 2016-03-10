To launch pig, cd into pig's directory:
```
cd training/pig
```

Then execute pig in local mode:
```
pig -x local
```

You can also execute a pig file instead of launching the interactive shell:
```
pig -f demo/happy_countries.pig -x local
```

I created a detailed video [tutorial about how you can use Pig](https://www.youtube.com/watch?v=kI_j6VQ7PcQ&feature=em-upload_owner).

You can find examples in the `demo` directory and solutions for the excercises in the `solutions` directory.

1. List countries we recieved payments from: [countries.pig](demo/countries.pig)
2. List how many payments we recieved from each country and what is the total of payments: [payments_per_country.pig](demo/payments_per_country.pig)
3. In the [satisfaction.txt](satisfaction.txt) you can find the results of a user satisfaction survey. The survey scale is from 0 to 100. List the happyest countries! [happy_countries.pig](demo/happy_countries.pig).

The excercises are very similar to the examples and the solutions can be found in the [solutions](solutions) directory:

1. List the different registration sources (such as organis, sem, ...)
2. Count how many registrations are there by registration source.
3. List the happy registration sources (just as the 3rd example in the demo).

If you want to play with more advanced examples, check out the [assignments](https://github.com/zoltanctoth/bigdata-training/blob/master/pig_examples/excercises.md) and the solutions in [this directory](https://github.com/zoltanctoth/bigdata-training/tree/master/pig_examples).

