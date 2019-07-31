
docker run --privileged=true  -v /tmp3:/tmp3/httpd/   -v   $(pwd)/ports.conf:/etc/httpd/conf.d/ports.conf  -v $(pwd)/yum_repo.conf:/etc/httpd/conf.d/yum_repo.conf    -p 999:8888 -p 9443:443     httpd:v1   
