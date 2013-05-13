#!/bin/bash

SCRIPT_DIR=/home/bschlenk/minecraft
LOG_DIR=$SCRIPT_DIR/log
LOCK_FILE=$SCRIPT_DIR/.lock_file
SCRIPT_LOG=$LOG_DIR/script.log

DOWNLOAD_SCRIPT=$SCRIPT_DIR/download_map.sh
DOWNLOAD_LOG=$LOG_DIR/download.log

UPDATE_SCRIPT=$SCRIPT_DIR/update_map.sh
UPDATE_LOG=$LOG_DIR/update.log

UPLOAD_SCRIPT=$SCRIPT_DIR/deliver_payload.sh
UPLOAD_LOG=$LOG_DIR/upload.log


mkdir -p $LOG_DIR

echo -e "\n" >> $SCRIPT_LOG
date >> $SCRIPT_LOG
if [ -e $LOCK_FILE ]
then
	echo "previous job still running. Exiting" >> $SCRIPT_LOG
	exit 1
fi

touch $LOCK_FILE

date >> $SCRIPT_LOG
echo "downloading map from server" >> $SCRIPT_LOG
(time $DOWNLOAD_SCRIPT) &>> $DOWNLOAD_LOG

date >> $SCRIPT_LOG
echo "rendering the map" >> $SCRIPT_LOG
(time $UPDATE_SCRIPT) &>> $UPDATE_LOG
date >> $SCRIPT_LOG

rm -rf $LOCK_FILE
