#!/bin/sh
if [ ! -d  AutoPiano ];then
	git clone https://github.com/WarpPrism/AutoPiano
fi

chmod +x entrypoint.sh 
docker build -t  autopiano:centos7   ./

echo docker run -it -p 5001:5000  autopiano:centos7  

