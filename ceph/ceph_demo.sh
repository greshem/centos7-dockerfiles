#192.168.166.7 以及网段 根据自己的需求  修改一下
docker run -d --net=host -v /etc/ceph:/etc/ceph -e MON_IP=192.168.166.7 -e CEPH_PUBLIC_NETWORK=192.168.166.0/24 ceph/demo

CONTAINER_ID=`docker ps -a | grep ceph/demo | awk '{print $1}'`


#docker  exec -it    $CONTAINER_ID /bin/bash
docker  exec -it    $CONTAINER_ID ceph -s 

