#!/usr/bin/env bash
docker run -d -t -P --link spark_master:spark_master bibinwilson/docker-spark /start-worker.sh "$@"
