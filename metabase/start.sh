docker run --name greshem-mysql   greshem-mysql:2019_06_21
docker run --name  greshem-metabase  --link greshem-mysql:db    -p 13000:3000   -v  /root/metabase.db_v2/:/metabase.db    metabase/metabase 


docker run  --name greshem-phpmyadmin -d --link greshem-mysql:db   --name myadmin -e PMA_HOST=db -e PMA_PORT=3306 -p 11880:80 phpmyadmin/phpmyadmin


