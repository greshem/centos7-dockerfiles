
#/root/bin/yum_repo_tools/centos75_greshem/nginx_yum_repo_router.conf

# 务必 保证 / tmp3/ 有  linux_src 目录 
#docker run  -v   /root/bin/yum_repo_tools/centos75_greshem/nginx_yum_repo_router.conf:/etc/nginx/conf.d/yum_repo_router.conf  -p 999:999 -p 9443:443   -v /tmp3/:/tmp3/   nginx:v1   


# /tmp3 映射到 虚机里面的 /tmp3 会失败  
# docker run --privileged=true  -v /tmp3/yum_repo/:/tmp3/   -v   /root/bin/yum_repo_tools/centos75_greshem/nginx_yum_repo_router.conf:/etc/nginx/conf.d/yum_repo_router.conf  -p 999:999 -p 9443:443     nginx:v1   


# 这种方式 没有问题
#docker run --privileged=true  -v /tmp3:/tmp3/    -v   $(pwd)/nginx_yum_repo_router.conf:/etc/nginx/conf.d/yum_repo_router.conf  -p 999:999 -p 9443:443     nginx:v1   
docker run   -v /tmp3:/tmp3/    -v   $(pwd)/nginx_yum_repo_router.conf:/etc/nginx/conf.d/yum_repo_router.conf  -p 999:999 -p 9443:443     nginx:v1   
