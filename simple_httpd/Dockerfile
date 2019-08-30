#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM  127.0.0.1:5001/docker.io/centos
#FROM centos

FROM  greshem/greshem_scm_base_common
RUN  mkdir /opt/data/

EXPOSE 33336
USER 1001

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
WORKDIR  /opt/data/

ENTRYPOINT [  "/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/opt/data " ]



