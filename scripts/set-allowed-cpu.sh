#!/bin/bash
systemctl set-property --runtime -- user.slice AllowedCPUs=16-23
systemctl set-property --runtime -- system.slice AllowedCPUs=16-23
systemctl set-property --runtime -- init.scope AllowedCPUs=16-23
#systemctl set-property --runtime -- cloud.slice AllowedCPUs=0-15
