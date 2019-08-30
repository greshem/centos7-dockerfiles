docker build -t greshem/vsftpd:centos7 ./

echo docker run -d -p 21:21 -v /my/data/directory:/home/vsftpd --name vsftpd greshem/vsftpd:centos7

ip=$(hostname -I |awk '{print $1}') 
echo docker run -d -v /my/data/directory:/home/vsftpd \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_USER=myuser -e FTP_PASS=mypass \
-e PASV_ADDRESS=$ip -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
--name vsftpd --restart=always greshem/vsftpd:centos7


yum install lftp 
lftp 

