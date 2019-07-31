docker build -t python36_build_env:centos7 ./

docker tag  python36_build_env:centos7   greshem/python36_build_env:centos7 
docker push  greshem/python36_build_env:centos7 



