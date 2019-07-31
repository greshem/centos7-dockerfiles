#FROM centos:7
FROM  greshem/greshem_scm_base_common
MAINTAINER greshem


RUN yum install -y  python36*
RUN wget  http://mirrors.163.com/gentoo/distfiles//pip-9.0.1.tar.gz
RUN mv pip-9.0.1.tar.gz  /tmp/ && cd tmp && tar -xzf pip-9.0.1.tar.gz   &&   cd  pip-9.0.1  && python36  setup.py  install 

RUN yum clean all
#RUN yum update -y && yum clean all

