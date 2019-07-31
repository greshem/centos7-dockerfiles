#!/bin/sh

if [ $# != 2 ];then
	echo "invalid param !!!"
	echo "eg: sh build.sh LIBVIRT_IP HOST_IP"
	exit 1
fi

#ÅäÖÃ
sed -i "s#^LIBVIRT_SERVER_IP.*#LIBVIRT_SERVER_IP=$1#g" collectd/build.sh
sed -i "s#^INFLUXDB_SERVER_IP.*#INFLUXDB_SERVER_IP=$2#g" collectd/build.sh

#if [ ! -f /usr/lib/systemd/system/docker.service.bak ];then
#	cp /usr/lib/systemd/system/docker.service /usr/lib/systemd/system/docker.service.bak
#fi
#sed -i "s#^ExecStart=.*#ExecStart=/usr/bin/docker-current daemon --registry-mirror=http://hub-mirror\.c\.163\.com \\\#g" /usr/lib/systemd/system/docker.service
#systemctl daemon-reload
#service docker restart


#²¿Êðcollectd
cd collectd
sh build.sh
IMAGE_ID=`docker images | grep confucian/collectd | awk '{print $3}'`
CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`
RET=`docker exec $CONTAINER_ID ps -ef | grep collectd | grep -v grep`
if [ ! $RET ];then
	echo "failed to build collectd"
	exit 1
fi
cd -


#²¿Êðinfluxdb
cd influxdb
sh build.sh
IMAGE_ID=`docker images | grep confucian/influxdb | awk '{print $3}'`
CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`
RET=`docker exec $CONTAINER_ID ps -ef | grep influxdb | grep -v grep`
if [ ! $RET ];then
	echo "failed to build influxdb"
	exit 1
fi
cd -


#²¿Êðgrafana
cd grafana
sh build.sh
IMAGE_ID=`docker images | grep confucian/grafana | awk '{print $3}'`
CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`
RET=`docker exec $CONTAINER_ID ps -ef | grep grafana | grep -v grep`
if [ ! $RET ];then
	echo "failed to build grafana"
	exit 1
fi
cd -


echo "=== Build Success ==="
