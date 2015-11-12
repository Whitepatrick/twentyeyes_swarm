#!/bin/bash

sudo docker build -t kibana-sb .

sudo docker run -d \
  --net=host \
  --name kibana-sb \
  kibana-sb
