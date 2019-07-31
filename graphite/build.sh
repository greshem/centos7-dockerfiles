#!/bin/bash
docker build  --no-cache -t confucian/graphite:v1 .

#get image id
IMAGE_ID=`docker images | grep confucian/graphite | awk '{print $3}'`

#start
docker run -d  -i -t --name=graphite -p 2003:2003 -p 30000:30000 $IMAGE_ID /bin/bash

CONTAINER_ID=`docker ps -a | grep $IMAGE_ID | awk '{print $1}'`

docker exec $CONTAINER_ID python /opt/graphite/webapp/graphite/manage.py syncdb
docker exec $CONTAINER_ID systemctl enable httpd
docker exec $CONTAINER_ID systemctl start httpd
docker exec $CONTAINER_ID /opt/graphite/bin/carbon-cache.py start
docker exec $CONTAINER_ID nohup /usr/bin/django-admin.py runserver --pythonpath /opt/graphite/webapp --settings graphite.settings 0.0.0.0:30000 &
