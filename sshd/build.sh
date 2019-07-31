#!/bin/bash

docker build -t    greshem_sshd .


# push 
#docker push  127.0.0.1:5001/greshem/simplehttpd:3.33

#
#docker run    127.0.0.1:5001/greshem/simplehttpd:3.33   


#--name=3333
# -v /home/username/opt/gitlab/data:/home/git/data \
#docker run    -p 33336:33336    -v /tmp3/portage/:/data 127.0.0.1:5001/greshem/simplehttpd:3.33 

docker run    -p 4444:22  greshem_sshd

