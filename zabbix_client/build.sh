#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  zabbix_agentd:centos7   ./
docker tag   zabbix_agentd:centos7   greshem/zabbix_agentd:centos7 
docker push  greshem/zabbix_agentd:centos7 
echo docker run     -e ZABBIX_SRV=10.99.31.151  -e HOSTNAME=DDDDD -p 10050:10050   zabbix_agentd:centos7   
echo docker run     -e ZABBIX_SRV=10.99.31.151  -e HOSTNAME=DDDDD --net host    zabbix_agentd:centos7     #net host 的模式 
