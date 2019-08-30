#!/bin/sh
chmod +x entrypoint.sh 
docker build -t  mkdocs ./
echo docker run  -p 8889:33333   -it   mkdocs 
echo docker run  -p 8889:33333   -it -v /root/bin_ext/education_markdown/docs/:/tmp/mkdocs/markdown_docs/docs/       greshem/mkdocs 

