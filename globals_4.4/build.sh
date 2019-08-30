#!/bin/sh
chmod +x entrypoint.sh 
#docker build -v /root/bin_ext/yum_repo_docker/yum.repos.d_greshem/:/etc/yum.repos.d/   -t  greshem:global   ./
if [ ! -d /root/global-4.4_logger/ ];then
    git clone  ssh://greshem:6787/home/svn_git/global-4.4_logger
fi
if [ ! -f /usr/bin/gtags_4.4 ];then
    cd  /root/global-4.4_logger/  &&  ./configure  && make  &&  bash /root/global-4.4_logger/install.sh 
fi

cp  entrypoint_golang.sh  entrypoint.sh 
docker build  -v /root/:/root/  -t  greshem-global4.4:go  ./


cp  entrypoint_python.sh  entrypoint.sh 
docker build  -v /root/:/root/  -t  greshem-global4.4:python  ./
