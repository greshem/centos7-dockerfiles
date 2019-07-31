#!/bin/bash
sed -i  's/127.0.0.1/0.0.0.0/g'  /etc/httpd/conf.d/phpMyAdmin.conf 


if [ ! -d /var/www/html/aa ];then
    cp -a -r /usr/share/phpMyAdmin/   /var/www/html/aa
fi
exec /usr/sbin/httpd -D FOREGROUND
