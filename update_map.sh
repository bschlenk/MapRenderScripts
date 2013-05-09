#!/bin/bash

SCRIPT_DIR=/home/bschlenk/minecraft

overviewer.py -v -v -v --config=$SCRIPT_DIR/config.py
overviewer.py --config=$SCRIPT_DIR/config.py --genpoi --skip-scan
