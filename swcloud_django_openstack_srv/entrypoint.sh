
if [ -z "$OPENSTACK_HOST" ];then
	echo "env  OPENSTACK_HOST is empty "
	exit 1
fi


if [ -z "$PUBLIC_IP_PORT" ];then
	echo "env  PUBLIC_IP_PORT is empty "
	exit 1
fi


mkdir /var/log/httpd/
mkdir /var/log/billing_payment/  &&  chmod  777  /var/log/billing_payment/
chmod 777  /var/log/billing_payment/

sed -i "s|OPENSTACK_HOST=.*|OPENSTACK_HOST = \"$OPENSTACK_HOST\"|g"   /opt/greshem/greshem/local/local_settings.py
sed -i "s|OPENSTACK_HOST = .*|OPENSTACK_HOST = \"$OPENSTACK_HOST\"|g" /opt/greshem/greshem/local/local_settings.py

# 						   /opt/greshem/static/openstack-dashboard-vue/dist/static/js/
sed -i "s|172.16.9.191:34444|$PUBLIC_IP_PORT|g"    /opt/greshem/static/openstack-dashboard-vue/dist/static/js/app*.js 
sed -i "s|127.0.0.1:8888|$PUBLIC_IP_PORT|g"    /opt/greshem/static/openstack-dashboard-vue/dist/static/js/app*.js 
sed -i "s|localhost:8888|$PUBLIC_IP_PORT|g"    /opt/greshem/static/openstack-dashboard-vue/dist/static/js/app*.js 

python manage.py  runserver  0:33333
