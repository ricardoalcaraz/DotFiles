# Commands
Update pacman packages for all

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