#!/bin/sh

export  LC_ALL="en_US.UTF-8" 


cd /tmp/ 
cd /tmp/mkdocs/markdown_docs/ 
mkdocs serve  -t readthedocs  -a 0.0.0.0:33333

