docker build -t rabbitmq:centos7 ./

docker run -d -p 5672:5672 -p 15672:15672 rabbitmq:centos7


echo "web:    http://0.0.0.0:15672 "
echo "admin 密码为空 "

