
if [ -z "$ZABBIX_SRV" ];then
	echo "env  ZABBIX_SRV is empty "
	exit 1
fi

if [ -z "$HOSTNAME" ];then
	echo "env  HOSTNAME is empty "
	exit 1
fi

sed   "s/ZABBIX_SRV/$ZABBIX_SRV/g" /etc/zabbix/zabbix_agentd.conf  > /tmp/zabbix_agentd.conf

sed  "s/HOSTNAME/$HOSTNAME/g"  -i  /tmp/zabbix_agentd.conf

while [ 1 ];
do
zabbix_agentd  -c /tmp/zabbix_agentd.conf -f
sleep 1
done
