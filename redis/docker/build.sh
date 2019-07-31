#!/bin/bash
docker build -t 127.0.0.1:5001/emotibot/redis .

# push 
docker push  127.0.0.1:5001/emotibot/redis  

