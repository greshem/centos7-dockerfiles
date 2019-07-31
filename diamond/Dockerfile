#FROM centos
FROM  greshem/greshem_scm_base_common
RUN yum -y install gcc 
RUN yum -y install python-pip
RUN yum -y install python-devel
COPY ./ /tmp/diamond/
#RUN pip install diamond
RUN         pip install   --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/      diamond 
RUN mkdir -p /var/log/diamond/
WORKDIR /usr/lib/python2.7/site-packages/etc/diamond/
COPY diamond.conf diamond.conf

USER 0
EXPOSE      33333
ENTRYPOINT [  "/tmp/diamond/entrypoint.sh" ] 
