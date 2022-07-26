This holds all of the configuration for a production setup. 

Current computers:
Bradbury - 4 core low power and reliable intel nuc with 1TB Samsung SSD and a 2TB hybrid firecuda drive
Huxley - 12 core Alder Lake monster. RTX 3090, 64GB of RAM, 2TB SSD + 1TB SSD + 5.5TB RAID 5 Array
Puck - 2 core low power intel nuc running at Jon's house
Namecheap - VPS with a static IP intended for proxy requests and reliable uptime

HUXLEY

Arch Linux OS on Alder Lake.
All services are exclusively running on the efficiency cores
High performance cores are reserved for services since each core has a set amount of cache
Both docker contaienrs and VMs can be pinned to cores so all high performance cores are reserved for a specific reason to maximize cache efficiency


Core Setup
0-3 (Arch Linux VM with 3090?)
4-7 (??)
8-11 Postgres
12-15 Redis
16-19 Host Processes and low power services

Achieved the above by creating a new cgroup called high-performance.slice and only allowing the programs to run on specific CPUs . The docker parent process runs on the efficiency cores by setting the slice through systemd and the child processes run on the high-performance.slice by setting the "cgroup-parent" to "high-performance.slice" on the config file at /etc/docker/daemon.json. Finally run /usr/bin/bind.sh script on startup that configures AllowedCpus dynamically for all services:

#!/bin/bash
systemctl set-property --runtime -- user.slice AllowedCPUs=16-19
systemctl set-property --runtime -- system.slice AllowedCPUs=16-19
systemctl set-property --runtime -- init.scope AllowedCPUs=16-19
systemctl set-property --runtime -- high-performance.slice AllowedCPUs=0-15

Vm Setup
#1 - Arch Linux
#2 - Windows

# NFS - 07/26/22
Added automatic share mounting with systemd for prometheus statistics shared folder save This will serve as a backup to the prometheus statistics

# TODO
- Add prometheus metrics to .net core app: https://github.com/prometheus-net/prometheus-net
- prometheus auth https://prometheus.io/docs/prometheus/latest/configuration/configuration/#scrape_config