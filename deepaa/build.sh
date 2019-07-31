if [ ! -f  ~/linux_src/DeepAA ];then
    git clone https://github.com/OsciiArt/DeepAA
fi

docker build -t deepaa:centos7 ./

docker tag  deepaa:centos7   greshem/deepaa:centos7 
docker push  greshem/deepaa:centos7 



