#!/bin/sh
set -x 
set -e 
echo  after  install start  app

pwd=$(pwd)

rm -rf /var/lib/mysql/*
#mysqld_safe
systemctl restart mariadb
systemctl status mariadb


#skip_innodb_doublewrite
#innodb_flush_log_at_trx_commit = 0

sed -i  '/^[mysqld]/ainnodb_flush_log_at_trx_commit = 0'  /etc/my.cnf 
sed -i  '/^[mysqld]/askip_innodb_doublewrite'  /etc/my.cnf 


sed -i  '/^[server]/ainnodb_flush_log_at_trx_commit = 0'  /etc/my.cnf.d/mariadb-server.cnf
sed -i  '/^[server]/askip_innodb_doublewrite'  /etc/my.cnf.d/mariadb-server.cnf




mysqladmin -u root      password  admin_pass 
mysql -uroot -padmin_pass  -e   'create database zabbix '


if [ ! -f  /usr/share/doc/zabbix-server-mysql-3.4.15/create.sql.gz ];then
    yumdownloader  zabbix-server-mysql 
    rpm -ivh zabbix-server-mysql-3.4.15-1.el7.x86_64.rpm   --force 
fi


cd  /usr/share/doc/zabbix-server-mysql-3.4.15/   && gzip -f -d create.sql.gz && mysql -uroot -padmin_pass     zabbix  <  create.sql

sed '/^DBUser/{s/.*/DBUser=root/g}'  /etc/zabbix/zabbix_server.conf  -i 
sed '/^# DBPassword/{s/.*/DBPassword=admin_pass/g}'  /etc/zabbix/zabbix_server.conf  -i 
sed '/^DBPassword/{s/.*/DBPassword=admin_pass/g}'  /etc/zabbix/zabbix_server.conf  -i 

cd $pwd

cp zabbix.conf.php  /etc/zabbix/web/ 
systemctl  restart  zabbix-server.service   


sed  -i '/^;post_max_size/{s/.*/post_max_size = 64M/}'            /etc/php.ini
sed  -i '/^post_max_size/{s/.*/post_max_size = 64M/}'            /etc/php.ini

sed  -i "/^;date.timezone/{s/.*/date.timezone=\'Asia\/Shanghai\'/g}"  /etc/php.ini
sed  -i "/^date.timezone/{s/.*/date.timezone=\'Asia\/Shanghai\'/g}"  /etc/php.ini

sed  -i "/^;max_execution_time/{s/.*/max_execution_time = 300/}"   /etc/php.ini
sed  -i "/^max_execution_time/{s/.*/max_execution_time = 300/}"   /etc/php.ini

sed  -i "/^;max_input_time/{s/.*/max_input_time = 600/}"            /etc/php.ini
sed  -i "/^max_input_time/{s/.*/max_input_time = 600/}"            /etc/php.ini
systemctl restart httpd 


echo "user/pass:  admin/zabbix "


systemctl status mariadb
systemctl status zabbix-server.service   
systemctl status httpd 



