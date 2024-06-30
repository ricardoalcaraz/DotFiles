# Commands
Update pacman packages for all

| Hostname            | MAC Address       | IPv4 Address    | IPv6 Addresses                             |
|---------------------|-------------------|-----------------|--------------------------------------------|
| camus               | 00:11:32:cd:d4:ad | 192.168.1.100   |  2600:1700:3529:b400::23                                          |
| camus-2             | 00:24:27:88:45:a2 | 192.168.1.66    |  2600:1700:3529:b400::42                                          |
| Indoorcam           | 04:17:b6:7e:30:0d | 192.168.1.222   | 2600:1700:3529:b400:617:b6ff:fe7e:300d     |
| iPhone              | 06:c5:af:67:67:92 | 192.168.1.218 |                                            |
| TL-SG108PE          | 1c:3b:f3:78:d1:e9 | 192.168.1.209   |                                            |
| C200_011C55         | 24:2f:d0:01:1c:55 | 192.168.1.115   |                                            |
| C200_01296A         | 24:2f:d0:01:29:6a | 192.168.1.224   |                                            |
| C200_012EE2         | 24:2f:d0:01:2e:e2 | 192.168.1.225   |                                            |
| Thermostat          | 44:61:32:f5:d4:72 | 192.168.1.120   | 2600:1700:3529:b400:4661:32ff:fef5:d472    |
| shoktho             | 50:eb:f6:7e:d8:d2 | 192.168.1.223   | 2600:1700:3529:b400::2c    |
| unknown7619348f5da2 | 56:a7:f7:c9:e5:9d | 192.168.1.226 |                                            |
| KP125               | 5c:62:8b:0f:0a:1b | 192.168.1.213   | fe80::5e62:8bff:fe0f:a1b                   |
| Ricardos-MBP        | 60:3e:5f:39:df:ba | 192.168.1.221   | 2600:1700:3529:b400:8cbf:177e:853c:11d8    |
| unknown7619348f5da2 | 76:19:34:8f:5d:a2 | 192.168.1.226   |                                            |
| unknown789c853ef3b1 | 78:9c:85:3e:f3:b1 | 192.168.1.219   |                                            |
| mainframe           | 84:3a:5b:51:78:de | 192.168.1.64    | 2600:1700:3529:b400:1887:8db5:97bf:6adc    |


## Ping
The following servers are available:
- shoktho: 63.205.195.249 50:eb:f6:7e:d8:d2

### Setup
 The following services are configured for every system

 #### SSH
 Must disable passwords and only allow pubkey auth

 #### UFW
  Configure firewall to only allow connections from trusted subnets
  
  #### Backups and Restores
The following commands allows backups to a tar file that can be archived

```bash
bsdtar --acls --xattrs -cpvaf "etc-backup.tar.gz" /etc/
```

```bash
bsdtar -xvf etc-backup.tar.bz2 -C /
```
### Ping Commands

#### All Hosts
```bash
ansible -u root all -m ping -i ./hosts
```

#### personal servers
```bash
ansible -u root arch-servers -m ping -i ./hosts
```

#### Droplets
```bash
ansible -u root -i ./hosts digitalocean -m ping
```

## Update

#### Droplets
```bash
ansible-playbook -i ./hosts update-pacman-digitalocean.yml
```

```bash
ansible-playbook -u root -i ./hosts postgres-info.yml
```

```bash
ansible-playbook -u root -i ./hosts install-packages.yml
```