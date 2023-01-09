#!/bin/bash

## Load vfio
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci

## Unbind VGA and audio from "standard" drivers
#echo 0000:01:00.0 > /sys/bus/pci/devices/0000:01:00.0/driver/unbind
#echo 0000:01:00.1 > /sys/bus/pci/devices/0000:01:00.1/driver/unbind

##Bind VGA and audio to vfio-pci
#echo 0000:01:00.0 > /sys/bus/pci/drivers/vfio-pci/bind
#echo 0000:01:00.1 > /sys/bus/pci/drivers/vfio-pci/bind


##Intel Arc
## Unbind VGA and audio from "standard" drivers
echo 0000:00:02.0 > /sys/bus/pci/devices/0000:00.02.0/driver/unbind

##Bind VGA and audio to vfio-pci
#echo 0000:02.00.0 > /sys/bus/pci/drivers/vfio-pci/bind
echo 0000:00:02.0 > /sys/bus/pci/drivers/vfio-pci/bind