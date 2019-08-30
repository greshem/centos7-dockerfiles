#!/bin/bash
# 服务器的搭建依赖  /root/bin/docker_2.1.1_register.pl 

#docker build -t 127.0.0.1:5001/greshem/simplehttpd:3.33 .
#docker build -t   127.0.0.1:5001/greshem/centos_kilo_keystone .
#docker build -t    gcc_compile .
#chmod +x entrypoint.sh 

docker build -t  gcc_build_env:centos7   ./
docker tag  gcc_build_env:centos7   greshem/gcc_build_env:centos7  
docker push   greshem/gcc_build_env:centos7  

echo 参考 /root/bin/csmitch_c_proc_gen_code.py 
echo docker run -it   greshem/gcc_build_env:centos7   /bin/bash 
echo docker run -it   -v $(pwd):/opt/src/ -w  /opt/src/   greshem/gcc_build_env:centos7    gcc  test.c -o test 


