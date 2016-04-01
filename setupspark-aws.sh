
sudo yum install -y git
git clone https://github.com/zoltanctoth/bigdata-training.git /home/hadoop/training

sudo pip install s3cmd==1.6.1 ipython[notebook]==4.1.0 py4j==0.9.2

export PYSPARK_SUBMIT_ARGS="--master yarn"
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --port=8889 --no-browser --ip='*''
export IPYTHON=1
pyspark

