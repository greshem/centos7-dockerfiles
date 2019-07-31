
FROM  esphome/esphome-docs

#FROM  greshem/python36_build_env:centos7  
MAINTAINER greshem


ADD ./ /opt/src/
WORKDIR /opt/src/esphome-docs/

#RUN   pip3.6 install -r req.txt 
#RUN  pip3 install --no-cache-dir --no-binary :all:  sphinx


EXPOSE 8000
#WORKDIR /data/esphome-docs
CMD ["make", "webserver"]
