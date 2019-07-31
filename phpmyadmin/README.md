dockerfiles-centos-wordpress-mariadb
====================================

This dockerfile creates wordpress image that is based on CentOS and
utilizes a centos/mariadb container for a database.

Build
-----

To build the wordpress container simply:

```
docker build -t <yourname>/wordpress:centos7 .

```

Setup Database
--------------

First get the mariadb container up and running:

```
VOLUME='-v /var/lib/mysql'
DATABASE=mydb
USER=myuser
PASSWORD=password
ROOTPASS=rootpass
docker run -d                        \
    -e MYSQL_USER=$USER              \
    -e MYSQL_PASSWORD=$PASSWORD      \
    -e MYSQL_DATABASE=$DATABASE      \
    -e MYSQL_ROOT_PASSWORD=$ROOTPASS \
    $VOLUME --name=mariadb centos/mariadb
```
NOTE:: If you don't want a VOLUME then don't assign the variable

Run wordpress
-------------

Next start the wordpress with the db container linked:

```
docker run --link=mariadb:db -d --name wordpress -p 80:80 <yourname>/wordpress
```

Now connect to wordpress on localhost:8080 from your browser.

# 重要的三个配合 
$cfg['Servers'][$i]['host']          = '172.16.8.117'; // MySQL hostname or IP address
$cfg['Servers'][$i]['auth_type']     = 'config';    // Authentication method (config, http or cookie based)?
$cfg['Servers'][$i]['user']          = 'root';          // MySQL user
$cfg['Servers'][$i]['password']      = 'admin_pass';          // MySQL password (only needed


#重启
apachectl -k restart  就可以重新使配置文件生效 
