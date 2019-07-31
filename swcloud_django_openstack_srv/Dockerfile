
#FROM  greshem_scm_base_common
#RUN  yum -y install git  python-pip python-pip python-devel gcc mysql-devel curl-devel
#  
FROM greshem/python27_build_env:centos7 

COPY  ./requirements.txt   /opt/
WORKDIR /opt/src/

RUN pip install    --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/   -r /opt/requirements.txt   

USER  0
EXPOSE 33333
ENTRYPOINT [  "bash", "/opt/src/entrypoint.sh" ]

