#!/bin/bash

COMMAND="rsync -azv --delete $REMOTE_USER@$REMOTE_HOST:$REMOTE_WORLD_DIR $RUN_DIR"
eval $COMMAND
