FROM ubuntu:14.04

MAINTAINER Bibin Wilson <bibin@xebia.com>

RUN apt-get -y update

RUN apt-get -y install wget

RUN apt-get install -y openjdk-7-jdk

RUN cd /usr/local && wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz

RUN cd /usr/local && tar -xvzf  spark-1.5.1-bin-hadoop2.6.tgz

RUN cd /usr/local && ln -s  spark-1.5.1-bin-hadoop2.6 spark

ENV SPARK_HOME /usr/local/spark

ENV JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/"

ADD scripts/spark-defaults.conf /spark-defaults.conf

ADD scripts/start-master.sh /start-master.sh

ADD scripts/start-worker /start-worker.sh

RUN chmod +x start-master.sh

RUN chmod +x start-worker.sh

ENV SPARK_MASTER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_WORKER_OPTS="-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_MASTER_PORT 7077

ENV SPARK_MASTER_WEBUI_PORT 8080

ENV SPARK_WORKER_PORT 8888

ENV SPARK_WORKER_WEBUI_PORT 8081

EXPOSE 8080 7077 8888 8081 4040 7001 7002 7003 7004 7005 7006
