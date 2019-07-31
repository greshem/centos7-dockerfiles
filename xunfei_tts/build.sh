#!/bin/sh
cp -a -r ~/Linux_voice_1.109/  ./
chmod +x entrypoint.sh 
docker build -t  tts   ./

