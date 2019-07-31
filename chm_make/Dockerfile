#FROM  127.0.0.1:5000/dnsmasq:latest
#FROM centos
FROM  docker.io/fedora

RUN   dnf install -y   wine-core.i686  perl  wget global tar perl-Template-Toolkit iputils 

COPY  wine_2016_12_08.tar.gz   ~/

WORKDIR /html/
RUN   cd ~/  && tar -xzvf   wine_2016_12_08.tar.gz 
RUN  yum clean all 

#ENTRYPOINT [  "cd","/data", "&&","/usr/bin/python",  "-m", "SimpleHTTPServer",  "33336",  "/data " ]
#WORKDIR  /data/

#ENTRYPOINT [  "/usr/sbin/sshd"   ]

