if [ ! -f  esphome-docs ];then
    git clone https://github.com/esphome/esphome-docs
fi

docker build -t esphome-docs:centos7 ./

docker tag  esphome-docs:centos7   greshem/esphome-docs:centos7 
docker push  greshem/esphome-docs:centos7 
echo docker run -it  --rm  greshem/esphome-docs:centos7  



