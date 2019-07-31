#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  zabbix:centos7   ./

echo docker run --name zabbixsrv -p 18080:80  -d zabbix:centos7

echo docker exec    zabbixsrv  bash -x  /opt/zabbix/entrypoint.sh 
docker tag  zabbix:centos7   greshem/zabbix_srv:centos7  
docker push  greshem/zabbix_srv:centos7  


