docker build -t registry:centos7 ./

echo "#1.
echo docker run -d -p 5000:5000 registry:centos7

echo "#2.
docker run --name=registry-data -v /var/lib/docker-registry registry:centos7
docker run --name=registry  -d -p 5000:5000 --volumes-from=registry-data <yourname>/registry:centos7
