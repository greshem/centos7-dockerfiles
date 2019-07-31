#!/bin/bash
# 服务器的搭建依赖  ~/bin/docker_2.1.1_register.pl 

#docker build -t 127.0.0.1:5001/greshem/simplehttpd:3.33 .
#docker build -t   127.0.0.1:5001/greshem/centos_kilo_keystone .
#docker build -t    gcc_compile .
#chmod +x entrypoint.sh 

docker build -t  gcc_build_env:centos7   ./
docker tag  gcc_build_env:centos7   greshem/gcc_build_env:centos7  
docker push   greshem/gcc_build_env:centos7  
