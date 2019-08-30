# docker run  

git clone  http://10.99.3.101:10088/root/greshem_docs.git 

docker run -p 8889:33333 -it -v /root/greshem_docs/docs/:/tmp/mkdocs/markdown_docs/docs/ mkdocs
