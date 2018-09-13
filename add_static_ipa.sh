#!/bin/bash
# A script to make a static ip address.
#
# Switch to root user
sudo su

# Delete the connection.
nmcli con del wired_static

# Delete all wired connections.
# nmcli con show | grep ethernet| awk '{print $2}' | while read line; do nmcli con delete uuid $line; done

# Create the connection
nmcli con add con-name "wired_static" ifname eth0 type ethernet ip4 172.17.1.$1/24 gw4 172.17.1.10
nmcli con mod "wired_static" ipv4.dns "172.17.1.2,172.17.1.11"
nmcli con up "wired_static"
nmcli con show "wired_static"

