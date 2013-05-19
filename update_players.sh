#!/bin/bash

SCRIPT_DIR=/home/bschlenk/minecraft
USER=brian
HOST=home.bschlenk.com
LOCAL_DIRECTORY=/home/bschlenk/minecraft/world
PORT=2222

rsync -avz --delete -e "ssh -p $PORT" $USER@$HOST:minecraft/world/players :minecraft/world/level.dat $LOCAL_DIRECTORY
overviewer.py --config=$SCRIPT_DIR/config.py --genpoi --skip-scan
