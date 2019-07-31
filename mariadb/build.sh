docker build -t mariadb:centos7 ./

echo docker run --name=mariadb -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin_pass mariadb:centos7

ip=$(hostname -I |awk '{print $1}')
echo mysql  -h  127.0.0.1 -padmin_pass
echo mysql  -h $ip   -padmin_pass


