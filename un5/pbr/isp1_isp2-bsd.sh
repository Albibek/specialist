#!/bin/sh

/sbin/pfctl -t ISP1 -T flush
/sbin/pfctl -t ISP2 -T flush

/sbin/pfctl -t ISP1 -T add 192.168.X.0/25
/sbin/pfctl -t ISP2 -T add 192.168.X.128/25

/sbin/pfctl -F state
