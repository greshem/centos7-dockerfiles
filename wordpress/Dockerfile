# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

#FROM centos:centos7
FROM  greshem/greshem_scm_base_common
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update &&\
    yum clean all

RUN yum -y install httpd php php-mysql php-gd openssl psmisc tar &&\
    yum clean all

ADD scripts /scripts
#https://wordpress.org/wordpress-4.8.6.tar.gz
# http://wordpress.org/latest.tar.gz                         
RUN curl -LO http://wordpress.org/wordpress-4.8.6.tar.gz                &&\
    tar xvzf /wordpress-4.8.6.tar.gz -C /var/www/html --strip-components=1       &&\
    chown -R apache:apache /var/www/                                    &&\
    chmod 755 /scripts/*

EXPOSE 80
CMD ["/bin/bash", "/scripts/start.sh"]
