#!/bin/bash

##Unbind VGA and audio to vfio-pci
echo 0000:01:00.0 > /sys/bus/pci/devices/0000:01:00.0/driver/unbind
echo 0000:01:00.1 > /sys/bus/pci/devices/0000:01:00.1/driver/unbind

##load nvidia
modprobe nvidia

##Bind VGA and audio to "standard" drivers
sleep 1
echo 0000:01:00.0 > /sys/bus/pci/drivers/nvidia/bind
echo 0000:01:00.1 > /sys/bus/pci/drivers/snd_hda_intel/bind

## Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio