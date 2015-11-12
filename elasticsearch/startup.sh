#!/bin/bash

sudo docker build -t elastic-sb . \
BASE=$HOME/workspace/elk-swarm/

sudo docker run -d \
  -v "$BASE"/elasticsearch/config:/usr/share/elasticsearch/data \
  -v "$BASE"/elasticsearch/esdata:/usr/share/elasticsearch/esdata \
  --name=elastic-sb \
  --net=host \
  elastic-sb
