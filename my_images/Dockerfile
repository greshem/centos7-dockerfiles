#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM centos
FROM  127.0.0.1:5001/docker.io/centos
RUN  mkdir /data/
RUN  echo bbbb > /tmp/bbbbb

EXPOSE 33336

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
WORKDIR  /data/

ENTRYPOINT [  "/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]

