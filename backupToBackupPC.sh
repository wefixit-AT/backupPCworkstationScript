#!/bin/bash
#
# last change: 3.1.2015
#
# description: this is a script which can be started as cronjob or startup script do
#   make daily backus to the BackupPc-Server for clients which are not online all the
#   time like server, eg. for workstations.
# url: https://blog.wefixit.at/?p=59
#
# author: gregor binder
# contact: office@wefixit.at
# license: Creative Commons by-nc-sa 4.0 http://creativecommons.org/licenses/by-nc-sa/4.0

source /path/to/backupToBackupPC.config

log "last backup: `cat $FILE_LAST_STATE`"
if [ `cat $FILE_LAST_STATE` -eq $TODAY ]; then
	log "today a backup was made. quit."
	exit 0
fi

if ! checkPid; then
    log "the backup is still running in the background. quit"
    exit 0
fi

nohup $JOB < /dev/null >> /dev/null 2>&1 &
pid=$!
log "backup started with pid $pid"
echo $pid > $PIDFILE
