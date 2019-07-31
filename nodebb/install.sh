git clone  https://github.com/NodeBB/NodeBB 
cd NodeBB/
docker build -t  nodebb:centos7 ./ 

#cat Dockerfile 
docker run -p  4567:4567    nodebb:centos7   
echo 启动 本机的redis  bind 修改成  0.0.0.0 

echo 界面上配置完成之后  容器被关闭 ,
echo 然后再启动 


