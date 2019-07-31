
#FROM centos:centos7
FROM  greshem/greshem_scm_base_common

RUN yum -y update; yum clean all
RUN yum -y install dnsmasq; yum clean all

ADD  resolv.conf.dnsmasq    /etc/resolv.conf.dnsmasq
ADD  dnsmasq.hosts          /etc/dnsmasq.hosts
ADD  dnsmasq.conf           /etc/dnsmasq.conf 

COPY ./  /opt/dnsmasq/

#RUN mkdir -p /data/db

EXPOSE 53 53/udp
#/usr/sbin/dnsmasq
#/usr/sbin/dnsmasq --conf-file=./office.conf --leasefile-ro 
ENTRYPOINT ["/usr/sbin/dnsmasq",  "-d", "--conf-file=/etc/dnsmasq.conf" ]
#ENTRYPOINT [  "/usr/bin/python3",  "-m", "http.server",   "33336"    ]

