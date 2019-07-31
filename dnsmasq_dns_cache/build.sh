#docker build --no-cache -t dnsmasq:centos7 ./
docker build  -t dnsmasq:centos7 ./
echo docker run -d -p 53:53/udp  dnsmasq:centos7

docker tag  dnsmasq:centos7 greshem/dnsmasq:centos7
docker push  greshem/dnsmasq:centos7

#echo "web:    http://0.0.0.0:15672 "
#echo "admin 密码为空 "

