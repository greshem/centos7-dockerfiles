#!/bin/bash

#build dockerfile
docker build  --no-cache -t confucian/grafana:v1 .

#get image id
IMAGE_ID=`docker images | grep confucian/grafana | awk '{print $3}'`

#ÔËÐÐÈÝÆ÷
docker run -d --privileged -i -t --name=grafana -p 3000:3000 $IMAGE_ID /usr/sbin/init

CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`
docker exec $CONTAINER_ID systemctl enable grafana-server.service
docker exec $CONTAINER_ID systemctl start grafana-server.service



