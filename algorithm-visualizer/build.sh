
set -x 
pwd=$(pwd)
cd ~

if [ ! -d ~/linux_src/algorithm-visualizer/ ];then
    echo "git clone  https://github.com/algorithm-visualizer/algorithm-visualizer "
    exit -1 
fi

cd  ~/linux_src/algorithm-visualizer/
#2017年的版本 
git reset  81323c467360dbddab7372fad49a49258972973d 
#npm install  

cd $pwd
cp -a -r ~/linux_src/algorithm-visualizer/ ./

chmod +x entrypoint.sh 
#docker build --no-cache  -t  algorithm-visualizer:centos7 ./
docker build   -t  algorithm-visualizer:centos7 ./

echo  docker run -p33333:22222  algorithm-visualizer:centos7 

rm -rf  algorithm-visualizer/
