## Controlling Services with ```systemctl```

### Listing unit files systemctl

* Query the state of all units to verify a system startup
```bash
[root@server ~]# systemctl
```

* Query the state of only the service units
```bash
[root@server ~]# systemctl --type=service
```

* Investigate any units which are in a failed or maintenance state
```bash
[root@server ~]# systemctl status rngd.service -l
```

* Easily show the active and enabled states
```bash
[root@server ~]# systemctl is-active sshd
[root@server ~]# systemctl is-enabled sshd
```

* List the active state of all loaded units
```bash
[root@server ~]# systemctl list-units --type=service
[root@server ~]# systemctl list-units --type=service --all
```

* View the enabled and disabled settings for all units
```bash
[root@server ~]# systemctl list-unit-files --type=service
```

* View only failed services
```bash
[root@server ~]# systemctl --failed --type=service
```

### Starting and stopping system daemons on a running system

* View the status of the service
```bash
[root@server ~]# systemctl status sshd.service
```

* Verify that the process is running
```bash
[root@server ~]# ps -up 1073
```

* Stop the service
```bash
[root@server ~]# systemctl stop sshd.service
```

* Start the service
```bash
[root@server ~]# systemctl start sshd.service
```

* Stop, then start, the service in a single command
```bash
[root@server ~]# systemctl restart sshd.service
```

* To read and reload its configuration file without a complete stop and start
```bash
[root@server ~]# systemctl reload sshd.service
```

* Masking services
```bash
[root@server ~]# systemctl mask network
[root@server ~]# systemctl unmask network
```

### Enabling system daemons to start or stop at boot

* Disable the service
```bash
[root@server ~]# systemctl disable sshd.service
```

* Enable the service
```bash
[root@server ~]# systemctl enable sshd.service
```

## Controlling the Boot Process

* Setting a default target
```bash
[root@server ~]# systemctl get-default
[root@server ~]# systemctl set-default graphical.target
```

### Recovering the root password
1. Reboot the system.
2. Interrupt the boot loader countdown by pressing any key.
3. Move the cursor to the entry that needs to be booted.
4. Press e to edit the selected entry.
5. Move the cursor to the kernel command line (the line starts with linux16).
6. Append ```rd.break```.
7. Press ```Ctrl+x``` to boot with the changes.

At this point, a root shell will be presented, with the root file system for the actual system mounted read-only on /sysroot.

To recover the root password from this point, use the following procedure:

1. Remout /sysroot as read-write
```bash
switch_root:/# mount -o remount,rw /sysroot
```
2. Switch into a chroot jail
```bash
switch_root:/# chroot /sysroot
```
3. Set a new root password
```bash
switch_root:/# passwd root
```
4. Make sure that all unlabeled files boot
```bash
sh-4.2# touch /.autorelabel
```
5. Type exit twice.

