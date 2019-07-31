#!/bin/sh
chmod +x entrypoint.sh 
#docker build -v ~/bin_ext/yum_repo_docker/yum.repos.d_greshem/:/etc/yum.repos.d/   -t  greshem:global   ./
if [ ! -d ~/global-4.4_logger/ ];then
    git clone  ssh://greshem/home/svn_git/global-4.4_logger
fi
if [ ! -f /usr/bin/gtags_4.4 ];then
    cd  ~/global-4.4_logger/  &&  ./configure  && make  &&  bash ~/global-4.4_logger/install.sh 
fi

cp  entrypoint_golang.sh  entrypoint.sh 
docker build  -v ~/:~/  -t  greshem-global4.4:go  ./


cp  entrypoint_python.sh  entrypoint.sh 
docker build  -v ~/:~/  -t  greshem-global4.4:python  ./
