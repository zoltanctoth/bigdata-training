Start a cluster
==================

*CLI:*
------
aws emr create-cluster --steps Type=CUSTOM_JAR,Name=Tez,ActionOnFailure=CONTINUE,Jar=s3://elasticmapreduce/libs/script-runner/script-runner.jar,Args=["s3://support.elasticmapreduce/tez/bigtop/install-tez.rb"] --release-label emr-4.6.0 --applications Name=Spark Name=Hadoop Name=HCatalog Name=Hive Name=Pig --instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.xlarge InstanceGroupType=CORE,InstanceCount=2,InstanceType=m3.xlarge  --ec2-attributes AvailabilityZone=us-west-2c,InstanceProfile=EMR_EC2_DefaultRole,KeyName=zoltanctoth --service-role EMR_DefaultRole --name "Spark and Tez"

*Web*:
------
 Select Custom JAR step (no autotermination), location:
`s3://elasticmapreduce/libs/script-runner/script-runner.jar`.  Arguments: `s3://support.elasticmapreduce/tez/bigtop/install-tez.rb`


Hive
======
 - Hive architecture

````
hive> create table payments (
      payment_date string,
      user_id int,
      amount int
    )
    row format delimited fields terminated by ',' ;
````

````
hadoop fs -mkdir /tmp/payments
hadoop fs -cp s3://zoltanctoth/payments/payments.csv /tmp/payments/

hadoop fs -ls /user/hive/warehouse/
````
````
hive> LOAD DATA INPATH '/tmp/payments' OVERWRITE INTO TABLE payments;

hadoop fs -ls /user/hive/warehouse/

hive> show tables
hive> describe payments
````

````
hive> set -v
hive> set hive.execution.engine=tez;

hive> SELECT * FROM payments LIMIT 10

hive> SELECT COUNT(*) FROM payments;

hive> SELECT payment_date, COUNT(*) FROM payments GROUP BY payment_date;
````

````
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=5000;
SET hive.exec.max.dynamic.partitions.pernode=5000;

set hive.enforce.bucketing = true;

set hive.execution.engine=tez;
````

*Feladat*: Csinalj magadnak egy user tablat


En particionalom a paymentset
````
CREATE table payments_by_date (
    user_id INT,
    amount INT
) PARTITIONED BY (date STRING);

INSERT OVERWRITE TABLE payments_by_date
PARTITION (date)
SELECT payment_date, user_id, amount
FROM payments;
````

*Feladat*: particionald a usert


Bucketelem a paymentet
````
CREATE table payments_by_date_bucketed (
    user_id INT,
    amount INT
) PARTITIONED BY (date STRING)
CLUSTERED BY(user_id) INTO 10 BUCKETS;


INSERT OVERWRITE TABLE payments_by_date_bucketed
PARTITION (date)
SELECT user_id, amount, payment_date
FROM payments;
````

*Feladat*: bucketeld a usert

````
Query:
SELECT city, SUM(amount) FROM payments_by_date_bucketed p JOIN users_by_city_bucketed u ON (u.user_id = p.user_id) GROUP BY city;
````

Pig
===

````
pig -useHCatalog -x tez
````

````
payments = LOAD 'payments' USING org.apache.hive.hcatalog.pig.HCatLoader();
````

Spark
=====

````
sqlContext.read.table("payments")
...
df.write.saveAsTable("valami")

hadoop fs -ls /user/hive/warehouse/valami
````
