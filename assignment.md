Assignment
==========

There is a file on S3, at `s3://zoltanctoth/ceu/signup.log` . It is rather big, but fortunately there is a sample of it at `s3://zoltanctoth/ceu/signup-sample.log`.

**NOTE: Some of you reported that s3cmd cp does not work correctly. If you have problems executing `s3cmd cp`, please execute `s3cmd get` and `s3cmd put` to solve the issue of s3cmd cp not working**.

AWS/S3/Unix
-----------
1. Create an S3 bucket using the format `ceu2016<your username>`. Mine would be: `ceu2016tothz`.
2. Create an EMR cluster and log in into it.
3. Install s3cmd: `pip install s3cmd`. *Note: You don't need to configure s3cmd with the AWS access and secret keys. This is automatically handled by the EMR cluster. `s3cmd` should work out of the box. [Here is a quick intro to s3cmd.](http://s3tools.org/s3cmd-howto)*
4. Download the sample to the local filesystem of the cluster using `s3cmd` and take a look at it.
5. Answer the following question with the help of the [unix command line tools](https://github.com/zoltanctoth/bigdata-training/blob/master/commandline.md),
   using the local file that was created in step (4):
   Which registration sources are there in the file? Only list every source one
   time (get rid of the duplicates). For example, `organic` and `display` are
   registration sources. Your task is to create a unix "pipeline" that displays
   the different registration sources and stores it in a local file called `sources.txt`.
6. When the local file was created, upload it into your bucket using the same name: `sources.txt`.
7. Put the commands you used in (5, 6, 7) in a text editor (on your personal computer), save it using the name `unixsolution.txt`. Go to the S3 menu of the AWS Management Console in your browser and upload this file into your bucket.

Pig
---
1. Create an EMR cluster and start pig.
2. Copy s3://zoltanctoth/ceu/signup.log into your own bucket using `s3cmd`.

**If you consider yourself as a non-technical person:**

1. Answer this question using pig:

 What are the different amounts that were payed by users from the Netherlands (country code NL)? DUMP the file on the screen. STORE these amounts in a file called `amounts.txt` in your bucket (you will need to use the STORE command with the path `s3://<yourbucketname>/amounts.txt`). (If you do it correctly, the file will contain two lines:
```
59
99
```
2. Put your final set of commands you executed in pig in a text editor on your personal computer, and use the AWS Management Console to upload this file into your bucket, using the name `amounts.pig`.

**If you consider yourself as a technical person:**

1. There is a registration/payment log with email addresses in `s3://zoltanctoth/ceu/web.log`.
2. The results of a customer satisfaction survey are stored in `s3://zoltanctoth/ceu/satisfaction.txt`.
3. We have a hypothesis that those users who have *gmail.com* email addresses are in general more satisfied with our services than those,
who come with an *outlook.com* email address. Is this right? What can you see in the data?
4. Upload the two solutions into your bucket with the name: `happier.pig` and `nl.pig`.
5. Upload your analysis (what you think and why) in text format into your bucket with the name `emailanalysis.txt`.

 You will need a few commands here which we have not covered. [The Pig Latin Reference manual](http://pig.apache.org/docs/r0.14.0/basic.html) is a great piece of documentation. Also, you can find [very similar pig scripts](https://github.com/zoltanctoth/bigdata-training/tree/master/pig/solutions) on my github.

Spark
---
**If you consider yourself as a non-technical person:**

1. Answer this question using Jupyter (iPython) Notebook on your virtual machine:

 What are the different amounts that were payed by users from the Netherlands (country code NL)? The input file is at `file:///home/bigdata/training/datasets/registration.log`. Show the results on the screen. Download the notebook (File -> Download as) in *HTML* fromat and upload it into your bucket with the name `spark-notebook.html`. 
 
 *Hint: If you have an RDD (called e.g. `rdd`) and you want to get rid of the duplicate values in it, simply use the `rdd.distinct()` transformation. I cover this in the recap video.*

**If you consider yourself as a technical person:**

1. There is a registration/payment log with email addresses in `s3://zoltanctoth/ceu/web.log`.
2. The results of a customer satisfaction survey are stored in `s3://zoltanctoth/ceu/satisfaction.txt`.
3. We have a hypothesis that those users who have *gmail.com* email addresses are in general more satisfied with our services than those,
who come with an *outlook.com* email address. Is this right? What can you see in the data? Use Spark on AWS.
4. Show the results on the screen. Download the notebook (File -> Download as) in *HTML* fromat and upload it into your bucket with the name `spark-advanced-notebook.html`. 
 You will need a few commands here which we have not covered. [The Spark programming guide manual](http://spark.apache.org/docs/latest/programming-guide.html#working-with-key-value-pairs) will help, especially the part with *Working with key value pairs*.

*Pro tip: You can avoid the key value pairs RDD part if you use dataframes and spark SQL as early as possible*


Finishing up
----------
1. Please go to the AWS Management Console and make sure that
I will be able access the files you uploaded (Select the files in the S3 browser and press *Actions* -> *Make Public*)
2. Send me an email to *zoltanctoth@gmail.com* that you are done.
