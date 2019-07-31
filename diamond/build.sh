#!/bin/bash

#graphite服务IP（不可用127.0.0.1）
#GRAPHITE_HANDLER_HOST=192.168.54.200

#配置
#cp -rf diamond.conf.example diamond.conf
#sed -i "s#GRAPHITE_HANDLER_HOST#$GRAPHITE_HANDLER_HOST#g" diamond.conf

#build dockerfile
#docker build  --no-cache -t diamond:centos7 .
docker build   -t diamond:centos7 .

