#!/bin/bash
#
# last change: 3.1.2015
#
# author: gregor binder
# contact: office@wefixit.at
# license: Creative Commons by-nc-sa 4.0 http://creativecommons.org/licenses/by-nc-sa/4.0
#
# usage: PIDFILE=/path/to/file.pid

source /path/to/lib/logging.sh

prefix="checkPid:"

function checkPid {
    log "$prefix check pidfile: $PIDFILE"
    if [ ! -f $PIDFILE ]; then
        log "$prefix is not running, no pid file available"
        return 0
    else
        pid=$(cat $PIDFILE)
        ps -p $pid &> /dev/null
        if [ $? -ne 0 ]; then
            log "$prefix is not running, but pid file exists $PIDFILE"
            return 0
        else
            log "$prefix is running with pid $pid"
            return 1
        fi
    fi
}
