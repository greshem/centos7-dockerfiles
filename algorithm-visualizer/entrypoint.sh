#!/bin/sh
#sed -i  '/app.listen/{s/.*/var server = app.listen(22222, "0.0.0.0")/}'  /opt/algorithm-visualizer/build/dev-server.js

# port: process.env.PORT || 8080,
# /root/linux_src/algorithm-visualizer/gulpfile.babel.js


cd /opt/algorithm-visualizer/

  #connect.server({
sed -i  '/connect.server(/a    host: "0.0.0.0",'  /opt/algorithm-visualizer/gulpfile.babel.js
sed -i  '/port: process.env.PORT/{s/8080/22222/g}'   /opt/algorithm-visualizer/gulpfile.babel.js

#npm run dev 
npm run start  #glup 启动

# 修改 添加   host 可以在 局域网内访问了 
# gulpfile.babel.js
#+    host: "0.0.0.0",
#     port: process.env.PORT || 8080,
