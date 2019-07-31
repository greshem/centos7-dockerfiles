#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  gentelella_django ./
echo docker run  -p 33333:8000   -it   gentelella_django 

