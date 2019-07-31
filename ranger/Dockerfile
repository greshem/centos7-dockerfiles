FROM  greshem/python36_build_env:centos7  
MAINTAINER greshem

ADD ./ /opt/src/
WORKDIR /opt/src/
RUN  yum install -y file 
RUN   pip3.6 install ranger-fm
