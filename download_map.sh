#!/bin/bash

USER=brian
HOST=home.bschlenk.com
REMOTE_DIRECTORY=minecraft/world
LOCAL_DIRECTORY=/home/bschlenk/minecraft
PORT=2222

rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:$REMOTE_DIRECTORY $LOCAL_DIRECTORY
