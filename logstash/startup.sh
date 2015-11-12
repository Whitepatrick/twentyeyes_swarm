#!/bin/bash

BASE=$HOME/workspace/elk-swarm/

sudo docker run -itd \
  --privileged \
  -v "$BASE"/logstash/config:/config \
  --net=host \
  --name=logstash-sb \
  logstash-sb \
  logstash -f /config/11-collectd.conf
