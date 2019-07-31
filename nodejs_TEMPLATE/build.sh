
set -x 
pwd=$(pwd)
cd ~

if [ ! -d ~/linux_src/nodejs_TEMPLATE/ ];then
    echo "git clone  https://github.com/nodejs_TEMPLATE/nodejs_TEMPLATE "
    exit -1 
fi

cd  ~/linux_src/nodejs_TEMPLATE/
#2017年的版本 
git reset  81323c467360dbddab7372fad49a49258972973d 
#npm install  

cd $pwd
cp -a -r ~/linux_src/nodejs_TEMPLATE/ ./

chmod +x entrypoint.sh 
#docker build --no-cache  -t  nodejs_TEMPLATE:centos7 ./
docker build   -t  nodejs_TEMPLATE:centos7 ./

echo  docker run -p33333:22222  nodejs_TEMPLATE:centos7 

rm -rf  nodejs_TEMPLATE/
