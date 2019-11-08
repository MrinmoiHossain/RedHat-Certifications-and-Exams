#!/bin/bash

# the root user
sudo -i

# show the network interfaces
ip link

# to list the network interfaces
nmcli con show

# create the connection for eno1
nmcli con add con-name eno1 type ethernet ifname eno1

# display the current IP address of eno1
ip addr show eno1

# configure the eno1 network
nmcli con mod eno1 ipv4.address "192.168.0.1/24"
nmcli con mod eno1 ipv4.method manual

# down and up the eno1 network
nmcli con down eno1
nmcli con up eno1

# ping IPv4 address
ping 192.168.0.1

# display the routing table
ip route

