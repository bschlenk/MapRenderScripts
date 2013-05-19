#!/bin/bash

USER=brian
HOST=home.bschlenk.com
REMOTE_FILE=minecraft/server.log
LOCAL_DIRECTORY=/home/bschlenk/mcstats
PORT=2222

rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:$REMOTE_FILE $LOCAL_DIRECTORY
