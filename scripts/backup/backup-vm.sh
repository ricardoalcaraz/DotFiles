#mount drives
chroot /mnt/archlinux
bsdtar --acls --xattrs -cpvf /mnt/backups/arch-vm.tar.bz2 --exclude "mnt/*" -I /usr/bin/pbzip2 /
