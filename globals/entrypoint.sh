#!/bin/sh

#if [ $# != 1 ];then
#    echo "Usage: $0 gtags|htags";
#    exit -1 
#fi
#name=$1
#echo $name 


cd /src/
gtags && htags 

#if  [[ $name == "gtags" ]]  ; then
#    gtags 
#else
#    htags 
#fi


echo  after  install start  app
echo sleep 3600 

