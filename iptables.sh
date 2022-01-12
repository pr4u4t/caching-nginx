#!/bin/bash

ip rule add fwmark 1 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
iptables -t mangle -A PREROUTING -p tcp -s 192.168.74.10/32 --sport 2598 -j MARK --set-xmark 0x1/0xffffffff
iptables -t mangle -A PREROUTING -p tcp -s 192.168.74.10/32 --sport 443  -j MARK --set-xmark 0x1/0xffffffff
