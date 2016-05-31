#!/bin/sh

ifconfig em1 inet 192.168.X.100 netmask 255.255.255.255 alias

# Step 2: ISP
#( netstat -nr | grep default ) && route delete default
# ifconfig em0 inet 172.16.0.13 netmask 255.255.255.0 alias
# route add default 172.16.0.1
# Arp update ONLY if needed
# See ISP_ARP: arp -a 

# ARP=$(cat /sys/class/net/eth0/address)
# # send_arp 192.168.X.100 ${ARP} 172.16.0.13 ff:ff:ff:ff:ff:ff eth0

# Step 3: NAT
# NAT is persistent on FreeBSD (see /etc/pf.conf)
# /usr/sbin/service pf restart

# Step 4: PBR
# ifconfig em3 inet 172.16.1.13 netmask 255.255.255.0 alias
