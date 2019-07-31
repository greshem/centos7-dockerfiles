
docker build -t ranger:centos7 ./

docker tag  ranger:centos7   greshem/ranger:centos7 
docker push  greshem/ranger:centos7 

echo docker run -it  --rm  greshem/ranger:centos7  /bin/bash 




