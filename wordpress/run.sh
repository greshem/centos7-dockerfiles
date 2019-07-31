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
    $VOLUME --name=mariadbwordpress mariadb:centos7


docker run --link=mariadbwordpress:db -d --name wordpress -p 3380:80 wordpress:centos7

