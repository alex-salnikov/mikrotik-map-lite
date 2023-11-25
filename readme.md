# Mikrotik / RouterOS
[mAP Lite](https://mikrotik.com/product/RBmAPL-2nD)

Specs
```
Product code	RBmAPL-2nD
Architecture	MIPSBE
CPU	QCA9533
CPU core count	1
CPU nominal frequency	650 MHz
Dimensions	48x49x11mm
RouterOS license	4
Operating System	RouterOS
Size of RAM	64 MB
Storage size	16 MB
Storage type	FLASH
```


# Find IP via MAC
```log
> arp -n | grep dc:2c:6e:xx:xx:xx
192.168.1.222            ether   dc:2c:6e:xx:xx:xx   C                     ens36
```

```log
ssh-keygen -b 2048 -t rsa -f ./map-lite-key -q -N ""
ssh-copy-id -i ./map-lite-key admin@192.168.1.222
```

# netinstall
[Netinstall](https://help.mikrotik.com/docs/display/ROS/Netinstall#Netinstall-InstructionsforLinux)
- https://mikrotik.com/download

Download netinstall, routeros and additional packages
```sh
# download 'netinstall'
wget https://download.mikrotik.com/routeros/7.12.1/netinstall-7.12.1.tar.gz
tar -xzf netinstall--7.12.1.tar.gz

# download 'routeros' for mipsbe
wget https://download.mikrotik.com/routeros/7.12.1/routeros-7.12.1-mipsbe.npk

# download & unpack additional packages for mipsbe
wget https://download.mikrotik.com/routeros/7.12.1/all_packages-mipsbe-7.12.1.zip
unzip all_packages-mipsbe-7.12.1.zip
#  inflating: calea-7.12.1-mipsbe.npk
#  inflating: gps-7.12.1-mipsbe.npk
#  inflating: iot-7.12.1-mipsbe.npk
#  inflating: lora-7.12.1-mipsbe.npk
#  inflating: lte-7.12.1-mipsbe.npk
#  inflating: tr069-client-7.12.1-mipsbe.npk
#  inflating: ups-7.12.1-mipsbe.npk
#  inflating: user-manager-7.12.1-mipsbe.npk
```

```sh
# upload firmware and custom setup-script (requires sudo)
sudo ./netinstall-cli -a 192.168.1.222 -s custom.scr routeros-7.12.1-mipsbe.npk
```

netinstall-cli help
```log
> ./netinstall-cli -?
Version: 7.12.1(2023-11-17 12:24:36)
Usage: ./netinstall-cli [-r] [-e] [-b] [-k <keyfile>] [-s <userscript>] (-i <interface> | -a <client-ip>) [PACKAGE]+
        -r
                apply default configuration
        -e
                apply empty configuration
        -b
                remove branding
```

Upload firmware & script
```log
> sudo ./netinstall-cli -a 192.168.1.222 -s custom.scr routeros-7.12.1-mipsbe.npk
Version: 7.12.1(2023-11-17 12:24:36)
Interface Mask: 255.255.255.0
Using Client IP: 192.168.1.222
Using Server IP: 192.168.1.163
Starting PXE server
Waiting for RouterBOARD...
client: DC:2C:6E:xx:xx:xx
Sending image: mips
sendFile 4920744
branding no
Discovered RouterBOARD...
Formatting...
Sending package routeros-7.12.1-mipsbe.npk ...
Sending autorun script custom.scr ...
Ready for reboot...
Sent reboot command
```


# Logon via SSH
logon
```log
> ssh admin@192.168.1.222
```

Basic commands
```log
[admin@unconfigured] > /user print
Columns: NAME, GROUP, LAST-LOGGED-IN
# NAME    GROUP  LAST-LOGGED-IN
;;; system default user
0 admin   full   1970-01-02 01:02:50
1 admin2  full   1970-01-02 01:07:02

[admin@unconfigured] > quit
```
