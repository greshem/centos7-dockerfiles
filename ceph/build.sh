#!/bin/sh
set -x 
#
# usage:
#    安装ceph: sh build.sh
#    卸载ceph: sh build.sh clean
#
#

#本机IP
#HOST_IP=192.168.54.200
#PUBLIC_NETWORK=192.168.54.0/24
#CLUSTER_NETWORK=192.168.54.0/24

HOST_IP=$(hostname -I |awk '{print $1}' ) 
PUBLIC_NETWORK=$(python  ~/bin/ip_2_network.py  $HOST_IP )
CLUSTER_NETWORK=$(python  ~/bin/ip_2_network.py  $HOST_IP )



function install_mon()
{
	#获取ceph image
	#docker pull ceph/mon

	#部署mon
	docker run -d --name mon0 -e MON_IP=$HOST_IP -e CEPH_PUBLIC_NETWORK=$PUBLIC_NETWORK -e MON_NAME=mon0 --net=host -v /etc/ceph:/etc/ceph -v /var/lib/ceph:/var/lib/ceph ceph/daemon mon

	sleep 5        

	#编辑ceph.conf
	FSID=`grep fsid /etc/ceph/ceph.conf | awk -F"=" '{print $2}'`
	if [ ! $FSID ];then
		echo "fsid is null"
		exit 1
	fi

	cp -rf ceph.conf /etc/ceph/
	sed -i "s#PUBLIC_NETWORK#$PUBLIC_NETWORK#g" /etc/ceph/ceph.conf
	sed -i "s#CLUSTER_NETWORK#$CLUSTER_NETWORK#g" /etc/ceph/ceph.conf
	sed -i "s#HOST_IP#$HOST_IP#g" /etc/ceph/ceph.conf
	sed -i "s#FSID#$FSID#g" /etc/ceph/ceph.conf

	#重启mon
	docker restart mon0
}

#尝试6次的osd 创建 
function run_osd()
{
	int=1
	while(( $int<=5 ))
	do
		docker run -d --name=$1 --net=host -v /etc/ceph:/etc/ceph -v /var/lib/ceph/:/var/lib/ceph/ -v /var/lib/ceph/$1:/var/lib/ceph/osd -e OSD_TYPE=directory -v /etc/localtime:/etc/localtime:ro ceph/daemon osd
		sleep 3
		RET=`docker ps -a | grep $1 | grep Exited | wc -l`
		if [ $RET = "0" ];then
			int=6
			echo "$1 create success"
		else
			CONTAINER_ID=`docker ps -a | grep $1 | awk '{print $1}'`
			docker rm -f $CONTAINER_ID
			echo "$1 create failure, try again"
		fi
		sleep 1
		let "int++"
	done
}

function install_osd()
{
	run_osd osd0
	run_osd osd1
}


function install_ceph_dash()
{
	yum -y install git
	yum -y install epel-release
	yum -y install python-pip
	yum -y install python-rados
	pip install flask
	git clone https://github.com/Crapworks/ceph-dash.git
	cd ceph-dash
	
	#start 0.0.0.0:5000
	nohup python ceph-dash.py &
	cd -
}

function clean()
{
	#删除容器
	docker kill `docker ps -a | grep 'ceph/daemon' | awk '{print $1}'`
	docker rm -f `docker ps -a | grep 'ceph/daemon' | awk '{print $1}'`
	
	#删除ceph本地文件
	if [ -d /etc/ceph ];then
		rm -rf /etc/ceph
	fi
	
	if [ -d /var/lib/ceph ];then
		rm -rf /var/lib/ceph
	fi	

	#kill ceph dash
	kill -9 `ps -ef | grep "python ceph-dash.py" | grep -v grep | awk '{print $2}'`
	
	#删除ceph dash
	if [ -d ceph-dash ];then
		rm -rf ceph-dash
	fi	
	echo "clean finished ..."
}


if [[ $1 = "clean" ]];then
	clean
else
	docker pull ceph/daemon
	setenforce 0
	install_mon
	install_osd
	#install_ceph_dash
	echo "install finished ..."
	echo "default dash url: http://$HOST_IP:5000/"
fi
