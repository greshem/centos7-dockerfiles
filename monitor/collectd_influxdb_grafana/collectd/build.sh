#!/bin/bash

#libvirt服务地址（不可用127.0.0.1）
LIBVIRT_SERVER_IP=192.168.130.142

#influxdb服务IP（不可用127.0.0.1）
INFLUXDB_SERVER_IP=192.168.131.138


#配置
cp -rf collectd.conf.example collectd.conf
sed -i "s#LIBVIRT_SERVER_IP#$LIBVIRT_SERVER_IP#g" collectd.conf
sed -i "s#INFLUXDB_SERVER_IP#$INFLUXDB_SERVER_IP#g" collectd.conf

#build dockerfile
docker build  --no-cache -t confucian/collectd:v1 .

#get image id
IMAGE_ID=`docker images | grep confucian/collectd | awk '{print $3}'`

#运行容器
docker run -d  -i -t --name=collectd $IMAGE_ID /usr/sbin/init
CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`

docker exec $CONTAINER_ID /usr/sbin/collectd




