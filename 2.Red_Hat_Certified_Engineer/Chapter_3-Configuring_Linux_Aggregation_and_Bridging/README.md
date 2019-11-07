## Configuring Network Teams

Four steps are used to create and activate a network team interface.

1. Create team interface.
2. Determine the IPv4 and/or IPv6 attributes of team interface.
3. Assign the port interfaces.
4. Bring the team and port interfaces up/down.

### 1. Create team interface

```
nmcli con add type team con-name CNAME ifname INAME [config JSON]
```

* CNAME: the name used to refer to the connection
* INAME: the interface name
* [config JSON]: the runner to be used
    * ``` '{"runner":{"name":"METHOD"}}' ```
    * METHOD: one of the following - broadcast, roundrobin, activebackup, loadbalance, lacp

```bash
[root@server ~]# nmcli con add type team con-name team0 ifname team0 config '{"runner":{"name":"loadbalance"}}'
```


### 2. Determine the IPv4 and/or IPv6 attributes of team interface

```bash
[root@server ~]# nmcli con mod team0 ipv4.address 1.2.3.4/24 ipv4.method manual connection.autoconnet yes
```

### 3. Assign the port interfaces

```
nmcli con add type team-slave con-name CNAME ifnam INAME master TEAM
```

* CNAME: the name used to refer to the port
* INAME: the name of an existing interface
* TEAM: the connection name of the network team interface

```bash
[root@server ~]# nmcli con add type team-slave con-name team0-port1 ifname eth0 master team0
```

### 4. Bring the team and port interfaces up/down

```
nmcli dev dis INAME
nmcli con up CNAME
```

* INAME: the device name of the team or port interface
* CNAME: the connection name of that interface

```bash
[root@server ~]# nmcli con up team0
[root@server ~]# nmcli dev dis eth0
```

### To display the team's state

```bash
[root@server ~]# teamdctl team0 state
```
