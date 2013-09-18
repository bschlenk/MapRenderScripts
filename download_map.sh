#!/bin/bash

USER=brian
HOST=swellserve.com
REMOTE_DIRECTORY=Minecraft/minecraft/world
LOCAL_DIRECTORY=/home/bschlenk/minecraft
PORT=22

rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:$REMOTE_DIRECTORY $LOCAL_DIRECTORY
