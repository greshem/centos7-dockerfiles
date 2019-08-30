#!/bin/sh
chmod +x entrypoint.sh 

#docker build -t  mongodb -v /etc/yum/pluginconf.d/fastestmirror.conf:/etc/yum/pluginconf.d/fastestmirror.conf  ./
docker  build -t  mongodb:centos7  ./
docker tag  mongodb:centos7  greshem/mongodb:centos7 
docker push  greshem/mongodb:centos7 

echo "#centos7 下mongodb 2.6.12 " 
echo docker run   -p  27017:27017   greshem/mongodb:centos7 
echo docker run   -p  27017:27017  -v  /var/lib/mongodb: /var/lib/mongodb  greshem/mongodb:centos7 
