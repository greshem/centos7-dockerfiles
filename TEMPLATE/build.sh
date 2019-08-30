if [ ! -f  /root/linux_src/TEMPLATE ];then
    git clone https://github.com/OsciiArt/TEMPLATE
fi

docker build -t TEMPLATE:centos7 ./

docker tag  TEMPLATE:centos7   greshem/TEMPLATE:centos7 
docker push  greshem/TEMPLATE:centos7 
echo docker run -it  --rm  greshem/TEMPLATE:centos7  /bin/bash 



