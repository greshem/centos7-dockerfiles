#docker run  -v  ./caddy.conf:/etc/caddy/caddy.conf -P3333:80  -v /tmp3:/usr/share/caddy/   caddy:v1 

docker run  -v  $(pwd)/caddy.conf:/etc/caddy/caddy.conf -p 3333:80 -p 9443:443   -v /tmp3:/usr/share/caddy/   caddy:v1   


echo 可以通过 /root/bin/filebrowser_usage.py  来代替 实现更好的文件管理的功能. 


