
git clone https://github.com/Gadgetoid/Pinout.xyz
cd  Pinout.xyz
docker build -t  pinout:centos7 ./
echo docker run -p 33445:5000  pinout:centos7 
