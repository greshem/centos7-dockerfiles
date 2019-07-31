#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM centos
FROM  docker.io/centos
RUN   yum -y  install centos-release-openstack-kilo.noarch
RUN   yum -y  install openstack-keystone*  python-keystone*
RUN   yum -y  install vim  openstack-utils
RUN   yum -y  install lsof

RUN   openstack-config --set /etc/keystone/keystone.conf    DEFAULT  admin_token  ADMIN
RUN   openstack-config --set /etc/keystone/keystone.conf    DEFAULT  debug  true
RUN   openstack-config --set /etc/keystone/keystone.conf    DEFAULT  use_stderr  true
RUN   openstack-config --set /etc/keystone/keystone.conf    database  connection  sqlite:////keyston.db


EXPOSE 5000
EXPOSE 35357

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
#WORKDIR  /data/

#ENTRYPOINT [  "/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]

