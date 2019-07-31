docker build -t python:centos7 ./
docker run -d -p 8080:8080 python:centos7

docker tag  python:centos7  greshem/python27_running_env:centos7 
docker push  greshem/python27_build_env:centos7 
