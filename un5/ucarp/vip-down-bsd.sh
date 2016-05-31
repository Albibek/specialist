#!/bin/sh

ifconfig em1 192.168.X.100 -alias

# Step 2: ISP
#( netstat -nr | grep default ) && route delete default
# ifconfig em0 inet 172.16.0.13 netmask 255.255.255.0 -alias
# route add default 192.168.X.100 

# Step 3: NAT
# NAT is persistent on FreeBSD (see /etc/pf.conf)
# We still need to restart it for NAT to start working
# /usr/sbin/service pf restart

# Step 4: PBR
# ifconfig em3 inet 172.16.1.13 -alias
#coreesponsing isp script here
# /opt/scripts/isp1_isp2.sh
