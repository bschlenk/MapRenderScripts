#!/bin/bash

WORLD=/home/brian/minecraft/world
SCRIPT_DIR=/home/brian/mapper
LOG_DIR=$SCRIPT_DIR/log
SCRIPT_LOG=$LOG_DIR/script.log
LOCK_FILE=$SCRIPT_DIR/.lock_file

mkdir -p $LOG_DIR

echo -e "\n" >> $SCRIPT_LOG
date >> $SCRIPT_LOG
if [ -e $LOCK_FILE ]
then
	echo "previous job still running. Exiting" >> $SCRIPT_LOG
	exit 1
fi

touch $LOCK_FILE

cp -R $WORLD .
(time overviewer.py -v -v -v --config=$SCRIPT_DIR/config.py) # &>> $SCRIPT_LOG
(time overviewer.py --config=$SCRIPT_DIR/config.py --genpoi --skip-scan) # &>> $SCRIPT_LOG

rm -rf $LOCK_FILE
