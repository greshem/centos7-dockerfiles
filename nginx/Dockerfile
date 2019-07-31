#FROM centos:7
FROM  greshem/greshem_scm_base_common

MAINTAINER greshem

RUN yum clean all
RUN yum update -y && yum clean all

#Setting up systemd
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/usr/sbin/init"]

RUN yum install -y systemd* && yum clean all
RUN yum install -y yum-utils yum-plugin-ovl tar git curl bind-utils unzip wget && yum clean all


RUN yum install -y nginx  && yum clean all
RUN systemctl enable nginx 

# initscripts (service wrapper for servicectl) is need othewise the Ambari is unable to start postgresql
RUN yum install -y initscripts && yum clean all



#ADD etc/yum.conf /etc/yum.conf 
RUN mkdir /tmp3/

ENV PS1 "[\u@nginx \W]# "
EXPOSE 80
EXPOSE 999
EXPOSE 443
