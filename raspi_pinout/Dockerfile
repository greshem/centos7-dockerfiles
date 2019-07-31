#FROM centos:7.4.1708
#FROM centos:7.0.1406
#FROM centos:7.1.1503
#FROM centos:7.2.1511
#FROM centos:7.3.1611
#FROM centos:7.4.1708
#FROM centos:7.5.1804
#RUN yum -y install epel-release
#RUN cd /opt/

#from ~/scm/greshem_scm_base_common/dockerfile 
FROM  greshem/greshem_scm_base_common
RUN yum -y install git  python-pip python-pip
COPY  ./requirements.txt   /opt/
RUN pip install    --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/   -r /opt/requirements.txt   


COPY  ./   /opt/pinout/
WORKDIR  /opt/pinout/

USER  0
EXPOSE 5000
# python manage.py  runserver 0:33333
#ENTRYPOINT [  "/usr/bin/python",  "manage.py",  "runserver",  "0:33333" ]
CMD ["make", "serve", "LANG=en"]
#ENTRYPOINT [  "bash", "entrypoint.sh" ]

