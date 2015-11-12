#!/bin/bash

sudo docker build -t elastic elasticsearch/.
sudo docker build -t logstash logstash/.
sudo docker build -t kibana kibana/.
sudo docker build -t nginx nginx/.
sudo docker build -t jenkins jenkins/docker/.
