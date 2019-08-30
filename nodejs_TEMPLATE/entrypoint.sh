#!/bin/sh
cd /opt/nodejs_TEMPLATE/

#1. express 的启动方式 
#sed -i  '/app.listen/{s/.*/var server = app.listen(22222, "0.0.0.0")/}'  /opt/nodejs_TEMPLATE/build/dev-server.js
# port: process.env.PORT || 8080,
# /root/linux_src/nodejs_TEMPLATE/gulpfile.babel.js


#2. glup 爱东方方式 
#connect.server({
sed -i  '/connect.server(/a    host: "0.0.0.0",'  /opt/nodejs_TEMPLATE/gulpfile.babel.js
sed -i  '/port: process.env.PORT/{s/8080/22222/g}'   /opt/nodejs_TEMPLATE/gulpfile.babel.js
npm run start  #glup 启动

#3. react-dev utils 的地方方式 
    # set POSRT  && npm run start 
