#!/bin/bash

SCRIPT_DIR=/home/bschlenk/minecraft
USER=brian
HOST=swellserve.com
LOCAL_DIRECTORY=/home/bschlenk/minecraft
PORT=22

rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:Minecraft/minecraft/world/players :minecraft/world/level.dat $LOCAL_DIRECTORY/world
rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:Minecraft/minecraft/server.log $LOCAL_DIRECTORY
overviewer.py --config=$SCRIPT_DIR/config.py --genpoi --skip-scan
