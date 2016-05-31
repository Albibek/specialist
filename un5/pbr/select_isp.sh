#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

ifconfig | grep -q 192.168.X.100 || exit 0

ip route delete default

# route add default gw 172.16.1.254 2>/dev/null || exit 0
# route add default 172.16.1.254 2>/dev/null || exit 0

ping -c3 ya.ru >/dev/null 2>&1
ALIVE1=$?

ip route delete default

# route add default gw 172.16.2.254
# route add default 172.16.2.254

ping -c3 ya.ru >/dev/null 2>&1
ALIVE2=$?

test $ALIVE1 -eq 0 && conf_name="isp1.sh"
test $ALIVE2 -eq 0 && conf_name="isp2.sh"
test $ALIVE1 -eq 0 && test $ALIVE2 -eq 0 && conf_name="isp1_isp2.sh"

# echo /root/$conf_name
# exit 0

test $conf_name = "`cat /tmp/conf_name`" && exit 0

echo $conf_name > /tmp/conf_name

eval /root/$conf_name
