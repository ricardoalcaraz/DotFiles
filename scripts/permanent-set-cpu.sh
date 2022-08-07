#!/bin/bash
systemctl set-property user.slice AllowedCPUs=16-19
systemctl set-property system.slice AllowedCPUs=16-19
systemctl set-property init.scope AllowedCPUs=16-19
systemctl set-property high-performance.slice AllowedCPUs=0-15
systemctl set-property full-cpu.slice AllowedCPUs=0-19