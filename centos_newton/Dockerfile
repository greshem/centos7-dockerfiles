#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM centos
FROM  docker.io/centos
RUN   yum -y  install centos-release-openstack-newton.noarch
RUN   yum -y  install openstack-keystone*  python-keystone*
RUN   yum -y  install vim
RUN   yum -y  install lsof

EXPOSE 5000
EXPOSE 35357

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
#WORKDIR  /data/

#ENTRYPOINT [  "/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]

