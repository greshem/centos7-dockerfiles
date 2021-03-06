#! /bin/bash


today=$(/bin/date +%Y_%m_%d)

#安装mysql是为了要mysqldump
yum -y install wget mysql rsync 
cd /opt
wget http://dl.cnezsoft.com/zentao/10.5/ZenTaoPMS.10.5.stable.zbox_64.tar.gz
tar xf ZenTaoPMS.10.5.stable.zbox_64.tar.gz
/opt/zbox/zbox start

if [ ! -d   /backup ];then
    mkdir /backup
fi

#导出sql文件,mysql-password:123456
#  /opt/zbox/run/mysql/mysqldump

#ssh  10.99.2.68  "/opt/zbox/run/mysql/mysqldump -u root -P 3306 -S /opt/zbox/tmp/mysql/mysql.sock -p zentao "  >  /backup/zentao-bak.sql  
ssh  10.99.2.68  "/opt/zbox/run/mysql/mysqldump -u root -P 3306    -S /opt/zbox/tmp/mysql/mysql.sock   zentao  "  > /backup/${today}_zentao-bak.sql  


#备份文档图片,后面是新的禅道IP地址
rsync -avH --progress '-e ssh -p 22'    root@10.99.2.68:/opt/zbox/app/zentao/www/data/upload/1/  /opt/zbox/app/zentao/www/data/upload/1/
if [ ! -f /opt/zbox/app/zentao/www/data/upload/1/201801/0811314708054ufm.zip ];then
	echo  0811314708054ufm.zip 文件不存在, rsync 出错.
fi
  

#导入sql文件
echo 新的服务器mysql 密码是123456
/opt/zbox/bin/mysql -u root -P 3306 -p 123456 -S /opt/zbox/tmp/mysql/mysql.sock -p zentao < /backup/${today}zentao-bak.sql
/opt/zbox/zbox status
