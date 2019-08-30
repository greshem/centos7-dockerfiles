#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  greshem_openstack_srv:centos7 ./
docker tag  greshem_openstack_srv:centos7  greshem/greshem_openstack_srv:centos7 
docker push  greshem/greshem_openstack_srv:centos7 

ip=$(hostname -I  |awk  '{print $1}' )
echo docker run    -it     -p 4444:33333   -v /root/greshem/:/opt/src/ -e  OPENSTACK_HOST=10.99.3.101 -e PUBLIC_IP_PORT=$ip:4444       greshem/greshem_openstack_srv:centos7 
