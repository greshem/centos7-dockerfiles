#!/bin/bash
# 服务器的搭建依赖  /root/bin/docker_2.1.1_register.pl 
docker build -t greshem/simplehttpd:centos7  .

docker build -f Dockerfile.python3  -t greshem/simplehttpd:python3  ./

docker push  greshem/simplehttpd:centos7  .
docker push  greshem/simplehttpd:python3 

echo docker run    -p 33336:33336    -v /tmp3/portage/:/opt/data    greshem/simplehttpd:centos7

docker run    -p 33336:33336    -v /tmp3/portage/:/opt/data    greshem/simplehttpd:python3
