#!/bin/sh
#docker build -t  greshem_scm_base_common   ./
set -x 
pwd=$(pwd)

cd  $pwd/
cp -a -r /etc/yum.repos.d/  ./


cd $pwd
docker build -t  greshem_scm_base_common   ./
docker  tag    greshem_scm_base_common greshem/greshem_scm_base_common:centos7

