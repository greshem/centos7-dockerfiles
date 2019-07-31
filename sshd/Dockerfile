#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM centos
FROM  docker.io/centos

RUN yum -y  install openssh-server which   lsof bash 
RUN sshd-keygen
#RUN /usr/sbin/sshd
#RUN lsof -i:22




EXPOSE 22

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
#WORKDIR  /data/

#ENTRYPOINT [  "/usr/sbin/sshd"   ]

