#!/bin/bash

if ! command -v ip &> /dev/null
then
    echo "command: ip could not be found"
    exit
fi

if ! command -v iptables &> /dev/null
then
    echo "iptables could not be found"
    exit
fi


ip rule add fwmark 1 lookup 100 || { echo "Failed to add fwmark"; exit }
ip route add local 0.0.0.0/0 dev lo table 100 || { echo "Failed to add local route"; exit }
iptables -t mangle -A PREROUTING -p tcp -s 192.168.74.10/32 --sport 2598 -j MARK --set-xmark 0x1/0xffffffff || { echo "Failed to add rule for port 2598"; exit }
iptables -t mangle -A PREROUTING -p tcp -s 192.168.74.10/32 --sport 443  -j MARK --set-xmark 0x1/0xffffffff || { echo "Failed to add rule for port 443"; exit }
