#!/bin/sh
set -e
docker build -t  python27_build_env:centos7   ./
echo docker run -it  python27_build_env:centos7   
docker tag   python27_build_env:centos7    greshem/python27_build_env:centos7   
docker push  greshem/python27_build_env:centos7   

