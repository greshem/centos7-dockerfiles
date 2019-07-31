FROM centos

RUN yum -y install epel-release
RUN yum -y install collectd collectd-virt collectd-ceph
COPY collectd.conf /etc/collectd.conf
