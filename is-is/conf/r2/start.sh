#!/bin/sh
sysctl -w net.ipv6.conf.all.forwarding=1
# enable Segment Routing for IPv6
sysctl -w net.ipv6.conf.all.seg6_enabled=1
echo "no service integrated-vtysh-config" >> /etc/frr/vtysh.conf

for dev in $(ip -o -6 a | awk '{ print $2 }' | grep -v "lo")
do
   sysctl -w net.ipv6.conf."$dev".seg6_enabled=1
done