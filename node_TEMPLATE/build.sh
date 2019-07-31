#!/bin/sh
if [ ! -d  TEMPLATE ];then
	git clone https://github.com/WarpPrism/TEMPLATE
fi

#chmod +x entrypoint.sh 

docker build -t  TEMPLATE:centos7   ./
echo docker run -it -p 5001:5000  TEMPLATE:centos7  

