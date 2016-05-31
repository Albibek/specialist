#!/bin/sh

echo "Downing $1 and $1:ucarp"
/sbin/ifdown -v --force $1:ucarp 

# Step 2: ISP
#( /sbin/ip route show | grep default ) && /sbin/ip route delete default
#/sbin/ifdown --force eth0
#/sbin/ip route add default via 192.168.X.100

# Step 3: NAT
#/sbin/iptables -t nat -F ISP_NAT 

# Step 4: PBR
#/sbin/ifdown --force eth3

