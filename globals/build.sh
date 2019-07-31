#!/bin/sh
chmod +x entrypoint.sh 
#docker build -v ~/bin_ext/yum_repo_docker/yum.repos.d_greshem/:/etc/yum.repos.d/   -t  greshem:global   ./
#docker build   -t  greshem:global6.5   ./
docker build   -t  global:6.5  ./

