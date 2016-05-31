#!/bin/sh

echo "Upping $1 and "$1:ucarp
/sbin/ifup -v --force $1:ucarp 

# Step 2: ISP
#( /sbin/ip route show | grep default ) && /sbin/ip route delete default
#/sbin/ifup -v --force eth0
# Arp update ONLY if needed
# See ISP_ARP: arp -a 

# ARP=$(cat /sys/class/net/eth0/address)
# # send_arp 192.168.X.100 ${ARP} 172.16.0.11 ff:ff:ff:ff:ff:ff eth0

# Step 3: NAT
# /sbin/iptables -t nat -F ISP_NAT
# /sbin/iptables -t nat -A ISP_NAT -o eth0 -s 192.168.X.0/24 -j SNAT --to-source 172.16.0.11

# Step 4: PBR
#/sbin/ifup -v --force eth3
# corresponding isp script here
# /opt/scripts/isp1_isp2.sh
# /sbin/iptables -t nat -A ISP_NAT -o eth3 -s 192.168.X.0/24 -j SNAT --to-source 172.16.1.11
