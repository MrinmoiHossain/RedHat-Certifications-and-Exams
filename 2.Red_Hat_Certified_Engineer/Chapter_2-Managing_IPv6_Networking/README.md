## IPv4 Networking

### Viewing networking information

The following command will show the status of all network devices.
```bash
[root@server ~]$ nmcli dev status
```

The following command will show a list of all connections.
```bash
[root@server ~]$ nmcli con show
[root@server ~]$ nmcli con show --active
```

The following command displays the current configuration of network interfaces on the system.
```bash
[root@server ~]$ ip addr show eth0
```

### Adding a network connection

```bash
[root@server ~]# nmcli con add con-name static-eth0 type ethernet ifname eno2 ipv4 1.2.3.4/5 gw4 3.4.5.6
```

### Controlling network connections

```bash
[root@server ~]# nmcli con up static-eth0
```

### Modifying network connection settings

```
nmcli con show NAME
```
* NAME: the name of the connection

```bash
[root@server ~]# nmcli con show static-eth0
```

Here, IPv4 Address: 7.6.5.4/3 and Gateway: 3.2.1.0
```bash
[root@server ~]# nmcli con mod static-eth0 ipv4.address "7.6.5.4/3 3.2.1.0" ipv4.method manual ipv4.dns 1.1.1.1 connection.autoconnect yes
```

### Deleting a network connection

```bash
[root@server ~]# nmcli con del static-eth0
```


## IPv6 Networking Concepts
An IPv6 address is a 128-bit number, normally expressed as eight colon-separated groups of four hexadecimal nibbles (half-bytes).
* Leading zeros in a group must always be suppressed.
* Use :: to shorten as much as possible. If two runs of zeros are equal in length, shorten the leftmost run of zeros by preference.
* Although it is allowed, do not use :: to shorten one group of zeros. Use :0: instead, and save :: for runs of zeros longer than a single group.
* Always use lowercase letters for hexadecimal numbers a through f.

### IPv6 Networking Configuration

### Adding an IPv6 network connection

```bash
[root@server ~]# nmcli con add con-name eno2 type ethernet ifname eno2 ip6 2001:db8:0:1::c000:207/64 gw6 2001:db8:0:1::1 ipv4 1.2.3.4/5 gw4 2.3.5.6
```

### Modifying network connection settings for IPv6

```bash
[root@server ~]# nmcli con mod static-eth0 ipv6.address "2001:db8:0:1::c325:207/64 2001:db8:0:1::1"
```

### Viewing IPv6 networking information
```bash
[root@server ~]$ nmcli con show
[root@server ~]$ ip addr show eth0
[root@server ~]# ip -6 route show
```

### IPv6 troubleshooting tools
#### Connectivity
```bash
[root@server ~]# ping6 2001:db8:0:1::1
```

#### Routing
```bash
[root@server ~]# tracepath6 2001:db8:0:1::1
```

### Ports and services
```bash
[root@server ~]# ss -A inet -n
[root@server ~]# netstat -46n
```