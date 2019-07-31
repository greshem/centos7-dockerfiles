#!/bin/sh
chmod +x entrypoint.sh 

#cp -a -r /var/www/html/prettyindustries.com/   ./
#cp -a -r /var/www/html/mysql/    ./
#rm -rf   prettyindustries.com/ 

docker build -t  prettyindustries ./


echo docker run  -p 33333:80   -v /var/www/html/mysql/:/var/lib/mysql   -v /var/www/html/prettyindustries.com/:/var/www/html/  -it   prettyindustries 

echo "####################"
for each in $(echo  \
    /var/www/html/aquatic-pond.com \
    /var/www/html/greshem_http_conf \
    /var/www/html/keven \
    /var/www/html/keven2 \
    /var/www/html/petty_china \
    /var/www/html/petty_china_new \
    /var/www/html/pretty \
    /var/www/html/prettyindustries.com \
    /var/www/html/pygj1209 \
    /var/www/html/sino_pet \
    /var/www/html/mysql )
do
    #echo $each
    echo docker run  -p 33333:80   -v /var/www/html/mysql/:/var/lib/mysql   -v $each:/var/www/html/  -it   prettyindustries 
done


