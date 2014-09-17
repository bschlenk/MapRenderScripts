#!/usr/bin/env bash

SCRIPT_LOG=$LOG_DIR/script.log
RENDER_LOG=$LOG_DIR/render.log
LOCKFILE=$RUN_DIR/.renderlock
UPDATE_SCRIPT=$LIB_DIR/download_map.sh
LOCKFD=99

# PRIVATE
_lock()             { flock -$1 $LOCKFD; }
_no_more_locking()  { _lock u; _lock xn && rm -f $LOCKFILE; }
_prepare_locking()  { if [ ! -f $LOCKFILE ]; then touch $LOCKFILE; fi; eval "exec $LOCKFD>\"$LOCKFILE\""; trap _no_more_locking EXIT; }

# ON START
_prepare_locking

# PUBLIC
exlock_now()        { _lock xn; }  # obtain an exclusive lock immediately or fail
exlock()            { _lock x; }   # obtain an exclusive lock
shlock()            { _lock s; }   # obtain a shared lock
unlock()            { _lock u; }   # drop a lock


log() {
	if [[ -z $1 ]]; then
		msg=""
	else
		msg=$1
	fi
	echo `date +'%F %T'` $msg >> $SCRIPT_LOG
}

exlock_now
if [ $? -ne 0 ]
then
	echo "previous job still running. Exiting" >> $SCRIPT_LOG
	exit 1
fi


log `time $UPDATE_SCRIPT`
(time overviewer.py -v -v -v --config=config.py -p 1) #&>> $RENDER_LOG)
log "elapsed render time: $elapsed"
elapsed=$((time overviewer.py --config=config.py --genpoi --skip-scan) &>> $RENDER_LOG)
log "elapsed genpoi time: $elapsed"

