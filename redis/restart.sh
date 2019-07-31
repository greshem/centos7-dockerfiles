#!/usr/bin/env bash
CNAME=redis
#DOCKER_IMG="docker-reg.emotibot.com.cn:9527/emotibot/redis"
DOCKER_IMG="127.0.0.1:5001/emotibot/redis"
#HOST_PORT=6379
HOST_PORT=6379

#DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#VOL=$DIR/volume
#mkdir -p $VOL

docker kill $CNAME
docker rm $CNAME

cmd="\
docker run -d \
  --restart="always" \
  --name $CNAME \
  -p $HOST_PORT:6379 \
  $DOCKER_IMG \
"
echo $cmd
$cmd
