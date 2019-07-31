#!/bin/bash
docker build -t simplehttpd:3.33 .

docker build -f Dockerfile.python3  -t simplehttpd:python3  ./

#
#docker run    127.0.0.1:5001/greshem/simplehttpd:3.33   

#--name=3333
# -v /home/username/opt/gitlab/data:/home/git/data \
echo docker run    -p 33336:33336    -v /data/portage/:/data    simplehttpd:3.33
docker run    -p 33336:33336    -v /data/portage/:/data    simplehttpd:python3
