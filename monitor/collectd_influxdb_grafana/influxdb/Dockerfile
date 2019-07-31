FROM centos

RUN yum install -y https://repos.influxdata.com/rhel/7Server/x86_64/stable/influxdb-1.1.1.x86_64.rpm

WORKDIR /etc/influxdb
COPY influxdb.conf.example influxdb.conf

RUN mkdir -p /usr/share/collectd
WORKDIR /usr/share/collectd
COPY types.db types.db
