#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/config
wget -N http://s3.amazonaws.com/MinecraftDownload/minecraft.jar -P $HOME_DIR/.minecraft/bin/
