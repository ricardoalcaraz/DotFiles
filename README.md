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

# FFMPEG
ffmpeg -hwaccel cuvid -hwaccel_output_format cuda -i ./touchstone.mov -c:v hevc_nvenc -preset slow -tag:v hvc1 -movflags faststart -an output.mp4

(working command however output is 1080p)
ffmpeg -hwaccel vaapi -hwaccel_output_format hevc_nvenc -i ./touchstone.mov -vf "hwupload_cuda" -c:v hevc_nvenc -preset slow -tag:v hvc1 -movflags faststart -an output_4k.mp4

ffmpeg -i ./touchstone.mov -vf "hwupload_cuda" -c:v hevc_nvenc -preset slow -tag:v hvc1 -movflags faststart -an output_4k.mp4


ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5277.MOV -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe /mnt/linux/test.webm

ffmpeg -hwaccel qsv -c:v hevc_qsv -load_plugin hevc_hw -vf -i /mnt/linux/IMG_5277.MOV -vf 'scale_vaapi=w=1920:h=1080:format=nv12' -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe -an output.webm

ffmpeg -hwaccel qsv -c:v hevc_qsv -hwaccel_output_format qsv -i /mnt/linux/IMG_5277.MOV -an -vf scale_qsv=w=1920:h=1080:format=nv12,format=nv12 -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe output.webm

ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5277.MOV -vf 'format=p010,hwupload' -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe -an output.webm

ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -i /mnt/linux/IMG_5277.MOV -f null -

ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5278.MOV -vf 'format=p010,hwupload' -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe -an output.webm


## Working intel ffmpeg commands
sudo ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5278.MOV -vf 'format=p010,hwupload' -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe -an /home/ralcaraz/chimney.webm

sudo ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5056.mov -vf 'format=p010,hwupload' -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe -an /home/ralcaraz/Videos/touchstone.webm

sudo ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -i /mnt/linux/IMG_5056.mov -vf 'format=p010,hwupload' -c:v vp9_vaapi -global_quality 50 -bf 1 -bsf:v vp9_raw_reorder,vp9_superframe /home/ralcaraz/Videos/touchstone.webm

## Working Nvidia ffmpeg commands