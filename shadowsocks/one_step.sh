
for each in $(dir -1 |grep conf$)
do
    nohup   sslocal -c  $each    & 
done
