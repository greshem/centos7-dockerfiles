#FROM centos
#FROM  greshem/greshem_scm_base_common
#RUN yum -y install gcc 
#RUN yum -y install python-pip
#RUN yum -y install python-devel

FROM greshem/python27_build_env:centos7   
COPY ./ /opt/diamond/

RUN         pip install   --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/      diamond 
RUN mkdir -p /var/log/diamond/
WORKDIR /usr/lib/python2.7/site-packages/etc/diamond/
COPY diamond.conf diamond.conf

USER 0
EXPOSE      33333
ENTRYPOINT [  "/opt/diamond/entrypoint.sh" ] 
