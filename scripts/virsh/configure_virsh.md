# Configuring graphics card isolation


## Setting early modules to load via mkinitpcio
i915 vfio_pci vfio vfio_iommu_type1
## AMD
vfio-pci.ids=


### Nvidia
vfio-pci.ids=10de:2204,10de:1aef,1462:3991,1002:ab28
MODULES=(btrfs i915 vfio_pci vfio vfio_iommu_type1)
BINARIES=(/usr/bin/btrfs)
FILES=()
HOOKS=(base systemd autodetect keyboard sd-vconsole modconf block filesystems fsck)
