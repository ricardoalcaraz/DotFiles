#!/bin/bash
systemctl set-property --runtime -- user.slice AllowedCPUs=16-19
systemctl set-property --runtime -- system.slice AllowedCPUs=16-19
systemctl set-property --runtime -- init.scope AllowedCPUs=16-19
systemctl set-property --runtime -- high-performance.slice AllowedCPUs=0-15
systemctl set-property --runtime -- full-cpu.slice AllowedCPUs=0-19