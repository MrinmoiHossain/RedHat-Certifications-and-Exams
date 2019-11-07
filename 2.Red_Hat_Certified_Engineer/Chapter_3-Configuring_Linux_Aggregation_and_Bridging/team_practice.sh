#!/bin/bash

# lab setup
lab teambridge setup

# display the current state of the existing network interfaces
ip link

# create team0 connection
nmcli con add type team con-name team0 ifname team0 config '{"runner":{"name":"activebackup"}}'

# define the ipv4 settings
nmcli con mod team0 ipv4.address 192.168.0.100/24 ipv4.method manual connection.autoconnect yes

# assign eno1 and eno2 as port interfaces
nmcli con add type team-slave con-name team0-port1 ifname eno1 master team0
nmcli con add type team-slave con-name team0-port2 ifname eno2 master team0

# check the current state
teamdctl team0 state

# ping the local network gateway through the team0 interface
ping -I team0 192.168.0.254

# bring the original port interface up
nmcli con up team0-port1
nmcli con up team0-port2
