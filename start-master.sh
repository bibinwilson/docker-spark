#!/usr/bin/env bash
docker pull bibinwilson/docker-spark
docker run -d -t -P --name spark_master bibinwilson/docker-spark /start-master.sh "$@"
