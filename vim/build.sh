if [ ! -f root_vim ];then
    cp -a -r ~/.vim root_vim
fi
cp -a -r ~/.vimrc  ./

docker build -t vim:centos7 ./
docker run -d -p 8080:8080 vim:centos7

docker tag  vim:centos7  greshem/vim:centos7 
docker push  greshem/vim:centos7 

rm -rf   root_vim/
