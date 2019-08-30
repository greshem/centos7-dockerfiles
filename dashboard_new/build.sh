#!/bin/bash
# 服务器的搭建依赖  ../docker_registry.sh

git clone  ssh://git@gitlab.qb.com/cloud/python-novaclient.git
git clone  ssh://git@gitlab.qb.com/cloud/python-neutronclient.git 
git clone  ssh://git@gitlab.qb.com/cloud/python-cinderclient.git
git clone  ssh://git@gitlab.qb.com/cloud/python-glanceclient.git
git clone  ssh://git@192.168.135.8/cloud/django_openstack_auth.git

tar -czf python-novaclient.tar.gz python-novaclient
tar -czf python-neutronclient.tar.gz python-neutronclient
tar -czf python-cinderclient.tar.gz python-cinderclient
tar -czf python-glanceclient.tar.gz python-glanceclient
tar -czf django_openstack_auth.tar.gz django_openstack_auth



rm -rf python-novaclient 
rm -rf python-neutronclient 
rm -rf python-cinderclient 
rm -rf python-glanceclient 
rm -rf django_openstack_auth 


#docker build -t dashboard_new:4444 -v /root/CI/docker/dashboard_new:/root/CI/ ./
docker build -t dashboard_new:4444 ./

#docker  tag  dashboard_new:4444 127.0.0.1:5001/greshem/dashboard_new:4444

#docker push  127.0.0.1:5001/greshem/dashboard_new:4444

#from registry 
#docker run -it   127.0.0.1:5001/greshem/dashboard_new:4444  /bin/bash
#docker run -it     dashboard_new:4444  /bin/bash


