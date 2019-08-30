#!/bin/bash

#build dockerfile
docker build  --no-cache -t confucian/influxdb:v1 .

#get image id
IMAGE_ID=`docker images | grep confucian/influxdb | awk '{print $3}'`

#ÔËÐÐÈÝÆ÷
docker run -d  -i -t --name=influxdb -p 8083:8083 -p 8086:8086 -p 8088:8088 -p 25826:25826/udp $IMAGE_ID /usr/sbin/init

CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`

docker exec $CONTAINER_ID nohup /usr/bin/influxd -pidfile /var/run/influxdb/influxd.pid -config /etc/influxdb/influxdb.conf &

