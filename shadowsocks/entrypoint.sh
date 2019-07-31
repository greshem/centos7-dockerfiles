set -x 
#python manage.py  runserver  0:33333

cd /tmp/ss/conf/

for each in $(dir -1 |grep conf$)
do
    nohup   sslocal -c  $each   > ${each}.nohup & 
done

sleep  $((365*24*60*60))
