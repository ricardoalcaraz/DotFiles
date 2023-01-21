#!/bin/bash
systemctl set-property --runtime -- user.slice AllowedCPUs=0-7,16-19
systemctl set-property --runtime -- system.slice AllowedCPUs=16-19
systemctl set-property --runtime -- init.scope AllowedCPUs=16-19
systemctl set-property --runtime -- cloud.slice AllowedCPUs=0-15