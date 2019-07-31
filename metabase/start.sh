docker run --name test-mysql  test-mysql:2019_06_21
docker run --name  test-metabase  --link test-mysql:db    -p 13000:3000   -v  ~/metabase.db_v2/:/metabase.db    metabase/metabase 


docker run  --name test-phpmyadmin -d --link test-mysql:db   --name myadmin -e PMA_HOST=db -e PMA_PORT=3306 -p 11880:80 phpmyadmin/phpmyadmin


