#!/bin/sh

cd /opt/gentelella_django/gentelella/
export  LC_ALL="en_US.UTF-8" 
#python manage.py syncdb 
#python manage.py  runserver  0:33333
echo "注意 HOST 的挑换成  * " 
python36  manage.py runserver  0:8000


