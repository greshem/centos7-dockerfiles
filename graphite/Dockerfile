FROM centos

#update and install some dependencies
RUN yum -y update
RUN yum install -y httpd net-snmp perl pycairo mod_wsgi python-devel git gcc-c++
RUN yum -y install epel-release

#install Python Package manager
RUN yum install -y python-pip node npm

##install the graphite within pip
#RUN pip install 'django<1.6'
#RUN pip install 'Twisted<12'
#RUN pip install 'django-tagging<0.4'
#RUN pip install whisper
#RUN pip install graphite-web
#RUN pip install carbon

RUN pip install   --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/    'django<1.6' 'Twisted<12' 'django-tagging<0.4' whisper graphite-web carbon

#configure
WORKDIR /opt/graphite/examples/
RUN cp example-graphite-vhost.conf /etc/httpd/conf.d/graphite.conf
WORKDIR /opt/graphite/conf/
RUN cp storage-schemas.conf.example storage-schemas.conf
RUN cp storage-aggregation.conf.example storage-aggregation.conf
RUN cp graphite.wsgi.example graphite.wsgi
RUN cp graphTemplates.conf.example graphTemplates.conf
RUN cp carbon.conf.example carbon.conf

RUN chown -R apache:apache /opt/graphite/storage/

EXPOSE 30000 2003

