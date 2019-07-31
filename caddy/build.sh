docker build -t caddy:centos7 ./

echo docker run  -v  /mnt/:/usr/share/caddy   caddy:centos7 
echo docker run  -p 3333:80 -p 9443:443   -v /tmp3:/usr/share/caddy/   caddy:centos7
