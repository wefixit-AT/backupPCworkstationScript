#!/bin/bash
#
# last change: 27.12.2014
#
# author: gregor binder
# contact: office@wefixit.at
# license: Creative Commons by-nc-sa 4.0 http://creativecommons.org/licenses/by-nc-sa/4.0
#
# usage: DEBUG=true # true | false

function log {
        if [ ! -z "$1" ] && [ "$1" != "" ] && [ "$DEBUG" = "true" ]; then
                echo "debug: $1"
        fi
}
