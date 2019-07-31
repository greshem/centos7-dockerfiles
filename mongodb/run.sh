docker run -it  -v /var/lib/mongodb/mongodb/:/var/lib/mongodb/  -p 27017:27017     mongodb 


# 管理页面
echo 添加如下连接:   mongodb://172.16.8.117 
docker run -p1234:1234 -e HOST=0.0.0.0 -e PORT=1234   mrvautin/adminmongo

