# Commands
Update pacman packages for all

## Ping
The following servers are available:
- bradbury
- huxley
- puck
- camus
- arch droplets
  - arch-beefy
  - arch-weak
  - arch-basic-weakest
  - arch-basic-amd
  - arch-basic-intel

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