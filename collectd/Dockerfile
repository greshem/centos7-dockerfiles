#FROM centos
FROM  greshem/greshem_scm_base_common

#RUN yum -y install epel-release
RUN yum -y install collectd collectd-virt collectd-ceph  
COPY collectd.conf /etc/collectd.conf

#ENTRYPOINT ['/usr/bin/collectd"']
CMD [ "/usr/sbin/collectd", "-f" ]
