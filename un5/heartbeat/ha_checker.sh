#!/bin/sh
RESMGR="/usr/share/heartbeat/ResourceManager"
USAGE="Usage: $0 <active|inactive> <command>"
LOG="/var/log/hacron_wraper.log"
#: Now running $0: $*
if [ -z "$1" ]; then
    echo $USAGE
    exit 1
fi
if [ -z "$2" ]; then
    echo $USAGE
    exit 1
fi 
echo "1: $1 --- 2: $2" >> $LOG
/usr/bin/cl_status hbstatus 2>&1 1>/dev/null
if [ "$?" = "1" ]; then # Heartbeat not running
#    echo "Heartbeat not running on $HOSTNAME" >&2
    exit 0 # We use 0 here to avoid mail messages fron cron
fi
#RES=$(cat /etc/ha.d/haresources | grep IPaddr | head -n 1 | sed -r 's!.*(IPaddr::([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}/[a-z0-9]+).*!\1!')
# There is a hidden paremeter allkeys, that does the same thing as the string below - searches haresources for keys and lists them
# Can also be written as $RESMGR listkeys '.*'
# Shows only first key, so we even don't need 'head -n 1' here
RES=$($RESMGR allkeys)
if [ -z "$RES" ]; then 
    echo "Resource not found in haresources" >&2
    exit 2
fi
#: Found resource: $RES
nohup $RESMGR status $RES > /dev/null 2> /dev/null < /dev/null
case $1 in
    active)
    if [ "$?" = "0" ]; then # "Running OK"
        echo "Run: $2" >> $LOG
        sh -c "$2"
    fi
    ;;
    inactive)
    if [ "$?" = "3" ]; then # "Not running"
        echo "Run: $2" >> $LOG
        sh -c "$2"
    fi 
    ;;
    *)
    echo $USAGE
    exit 1
    ;;
esac
