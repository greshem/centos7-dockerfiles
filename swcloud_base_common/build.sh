#!/bin/sh
#docker build -t  greshem_scm_base_common   ./
set -x 
pwd=$(pwd)
cd  /root/bin/yum_repo_tools/centos75_greshem/ &&  make 


cd  $pwd/
cp -a -r /etc/yum.repos.d/  ./
cd $pwd
#-v  /etc/yum.repos.d/:/etc/yum.repos.d/  -v /etc/resolv.conf:/etc/resolv.conf 
docker build -t  greshem_scm_base_common   ./

