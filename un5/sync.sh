#!/bin/sh
HOSTNAME=$(hostname -s)

if [ "$HOSTNAME" = "gate1" ]; then
    REMOTE="mgmt2"
elif [ "$HOSTNAME" = "gate2" ]; then
    REMOTE="mgmt1"
else
    echo "Wrong hostname"
    exit 1
fi

if [ "$1" = "" ]; then
    echo "Argument required"
    exit 1
else
    FILE=$1
fi

echo /usr/bin/rsync -aHzv $FILE $REMOTE::root$(readlink -f $FILE)
