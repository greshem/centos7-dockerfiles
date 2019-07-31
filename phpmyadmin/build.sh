docker build -t phpmyadmin:centos7 ./
#docker build --no-cache -t phpmyadmin:centos7 ./

echo docker run -p 38018:80 -v $(pwd)/config.inc.php:/etc/phpMyAdmin/config.inc.php   phpmyadmin:centos7  
echo docker run -p 38018:80   phpmyadmin:centos7  

echo 进入容器 修改  /etc/phpMyAdmin/config.inc.php 

echo "注意 认证模式: " 
echo cfg['Servers'][i]['auth_type']     = 'cookie';    
echo cfg['Servers'][i]['auth_type']     = 'config';    
echo cfg['Servers'][i]['auth_type']     = 'http';      


