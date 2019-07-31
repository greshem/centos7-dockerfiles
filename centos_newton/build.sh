#!/bin/bash
# 服务器的搭建依赖  ~/bin/docker_2.1.1_register.pl 

#docker build -t 127.0.0.1:5001/greshem/simplehttpd:3.33 .
#docker build -t   127.0.0.1:5001/greshem/centos_newton_keystone .
docker build -t    centos_newton_keystone .


# push 
#docker push  127.0.0.1:5001/greshem/simplehttpd:3.33

#
#docker run    127.0.0.1:5001/greshem/simplehttpd:3.33   


#--name=3333
# -v /home/username/opt/gitlab/data:/home/git/data \
#docker run    -p 33336:33336    -v /tmp3/portage/:/data 127.0.0.1:5001/greshem/simplehttpd:3.33 

