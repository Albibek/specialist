#!/bin/sh

ip rule del from 192.168.X/24 to 192.168.X/24 table main
while ip rule del from any table 101;do true;done
while ip rule del from any table 102;do true;done

ip rule add from 192.168.X.0/25 table 101
ip rule add from 192.168.X.128/25 table 102
ip rule add from 192.168.X/24 to 192.168.X/24 table main

/sbin/ip route flush cache
/usr/sbin/conntrack -F
