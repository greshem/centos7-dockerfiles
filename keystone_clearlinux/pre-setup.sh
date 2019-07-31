#!/bin/bash

IDENTITY_HOST="${IDENTITY_HOST:-localhost}"
KEYSTONE_DB_USER=keystone
KEYSTONE_DB_PASSWORD=914de29bc82616d7c159eaf9b1f39402
KEYSTONE_DB_NAME=keystone

sed -i.bak s/KEYSTONE_DB_USER/$KEYSTONE_DB_USER/g /etc/keystone/keystone.conf
sed -i.bak s/KEYSTONE_DB_PASSWORD/$KEYSTONE_DB_PASSWORD/g /etc/keystone/keystone.conf
sed -i.bak s/KEYSTONE_DB_NAME/$KEYSTONE_DB_NAME/g /etc/keystone/keystone.conf
sed -i.bak s/IDENTITY_HOST/$IDENTITY_HOST/g /etc/nginx/keystone.wsgi.conf

# MariaDB
mkdir /data
echo "datadir = /data" >> /etc/mariadb/my.cnf

# Initialize MariaDB data
/usr/bin/mysql-systemd-start pre
mysqld_safe &
mysqladmin --silent --wait=30 ping || exit 1

# Remove anonymous user access
mysql -e "DELETE FROM mysql.user WHERE User=\"\";"

# Remove test database
mysql -e "DROP DATABASE test;"

# Keystone Database and user
mysql -e "create database $KEYSTONE_DB_NAME;"
mysql -e "grant all on $KEYSTONE_DB_NAME.* to '$KEYSTONE_DB_USER'@'%' IDENTIFIED by '$KEYSTONE_DB_PASSWORD';"
mysql -e "grant all on $KEYSTONE_DB_NAME.* to '$KEYSTONE_DB_USER'@'localhost' IDENTIFIED BY '$KEYSTONE_DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Populate keystone database
keystone-manage db_sync

# Nginx & UWSGI
mkdir -p /run/uwsgi/keystone
sed -i 's/uid.*/ /' /usr/share/uwsgi/keystone/{public,admin}.ini
sed -i 's/gid.*/ /' /usr/share/uwsgi/keystone/{public,admin}.ini
echo "logto=/var/log/uwsgi-keystone-admin.log" >> /usr/share/uwsgi/keystone/admin.ini
echo "logto=/var/log/uwsgi-keystone-public.log" >> /usr/share/uwsgi/keystone/public.ini
/usr/bin/uwsgi --ini /usr/share/uwsgi/keystone/admin.ini -s /run/uwsgi/keystone/admin.sock &
/usr/bin/uwsgi --ini /usr/share/uwsgi/keystone/public.ini -s /run/uwsgi/keystone/public.sock &

mkdir /var/lib/nginx
echo "user  root;" >> /usr/share/nginx/conf/nginx.conf

# Reset MariaDB datadir
sed -i.bak "s/datadir =.*//g" /etc/mariadb/my.cnf
