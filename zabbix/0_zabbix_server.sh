# -*- coding: utf-8 -*-

setenforce 0
if [ ! -f /usr/bin/mysqladmin  ];then 
    yum install -y   mariadb-server
    systemctl restart mariadb

    #mysqladmin -u root -p""    password  new_password 
    mysqladmin -u root      password  admin_pass 
fi


if [ ! -f /etc/yum.repos.d/zabbix.repo ];then
    yum  -y install  https://mirrors.aliyun.com/zabbix/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm
    yum clean all 
    #yum install zabbix* 
fi

yum install -y  zabbix-server-mysql-3.4.15-1.el7.x86_64  zabbix-web-mysql-3.4.15-1.el7 
#yum -y  install zabbix-server-mysql zabbix-web-mysql

#--------------------------------------------------------------------------
if [ -f ~/.my.cnf  ];then

mysql   -e   'create database zabbix '
else
mysql -uroot -ppassword  -e   'create database zabbix '
fi

#--------------------------------------------------------------------------

cd  /usr/share/doc/zabbix-server-mysql-3.4.15/   && gzip -f -d create.sql.gz
if [ -f ~/.my.cnf  ];then
	#mysql   -e   'create database zabbix '
	mysql   zabbix  <  create.sql
else
	mysql -uroot -padmin_pass  -e   'create database zabbix '
fi




# /etc/zabbix/zabbix_server.conf
# 配置文件数据库的密码修改一下.
#DBUser=root
#DBPassword=admin_pass

sed '/^DBUser/{s/.*/DBUser=root/g}'  /etc/zabbix/zabbix_server.conf  -i 

# DBPassword=
sed '/^# DBPassword/{s/.*/DBPassword=admin_pass/g}'  /etc/zabbix/zabbix_server.conf  -i 
sed '/^DBPassword/{s/.*/DBPassword=admin_pass/g}'  /etc/zabbix/zabbix_server.conf  -i 

# 初始化页面
if [ -f   ~/zabbix.conf.php ]then
	cp ~/zabbix.conf.php  /etc/zabbix/web/ 
else
	cp zabbix.conf.php  /etc/zabbix/web/ 
fi


systemctl  restart  zabbix-server.service   
tail  /var/log/zabbix/zabbix_server.log 

#timeout  10  tail -f /var/log/zabbix/zabbix_server.log 

