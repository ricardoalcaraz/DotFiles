#make raid10far2 array with 512KiB chunk size
mdadm --create --verbose --level=10 --metadata=1.2 --chunk=512 --raid-devices=2 --layout=f2 /dev/md/bulkstorage /dev/sdb1 /dev/sdc1

# update config file with newly made raid array
mdadm --detail --scan >> /etc/mdadm.conf

# assemble newly made raid array
mdadm --assemble --scan
mkfs.ext4 -v -L myarray -b 4096 -E stride=128,stripe-width=256 /dev/md0