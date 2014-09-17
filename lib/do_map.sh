#!/bin/bash

LOCK_FILE=$RUN_DIR/.lock_file
SCRIPT_LOG=$LOG_DIR/script.log
DOWNLOAD_SCRIPT=$LIB_DIR/download_map.sh
DOWNLOAD_LOG=$LOG_DIR/download.log
UPDATE_SCRIPT=$LIB_DIR/update_map.sh
UPDATE_LOG=$LOG_DIR/update.log

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
