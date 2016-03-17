#!/usr/bin/env bash
docker run -d -t -P --name spark_master bibinwilson/docker-spark /start-master.sh "$@"
