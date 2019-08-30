#!/bin/bash
if [ ! -f  /root/wine_2016_12_08.tar.gz  ];
then
   echo  /root/wine_2016_12_08.tar.gz  不存在 请拷贝一下  
fi

docker build -t    chm_make .

#wget  http://greshem.51vip.biz:33444/linux_src/wine_2016_12_08.tar.gz



# push 
#docker push  127.0.0.1:5001/greshem/simplehttpd:3.33

#
#docker run    127.0.0.1:5001/greshem/simplehttpd:3.33   


#--name=3333
# -v /home/username/opt/gitlab/data:/home/git/data \
#docker run    -p 33336:33336    -v /tmp3/portage/:/data 127.0.0.1:5001/greshem/simplehttpd:3.33 
#docker run    -p 4444:22  greshem_sshd

