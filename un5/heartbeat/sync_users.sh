#!/bin/sh

SYNCTO=`/usr/bin/cl_status listnodes | grep -v \`hostname -s\` | head -n 1`
for U in $(cat /etc/ftpusers | grep -v '^\s*#'); do
    /usr/bin/rsync -aHzv /home/$U/ $SYNCTO::root/home/$U/
done
