# docker-spark
Docker container for running spark cluster.

### Building The Image:

``` docker build -t username/spark .```

### Deploying Spark Master

```docker run -d -t -P --name spark_master bibinwilson/docker-spark /start-master.sh "$@"```


### Deploying Spark Worker

```docker run -d -t -P --link spark_master:spark_master bibinwilson/docker-spark /start-worker.sh "$@"```

### Deploying Spark shell

```docker run -i -t -P --link spark_master:spark_master bibinwilson/docker-spark /spark-shell.sh "$@"```
