#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  greshem_redis:centos7  ./

echo docker run -p 6379:6379   greshem_redis:centos7  

