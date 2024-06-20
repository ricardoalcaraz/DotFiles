# create iso command
#mkarchiso -v -w /tmp/archiso-tmp /path/to/profile/
rm -rf /tmp/archiso-tmp
mkdir -m 777 /tmp/archiso-tmp
sudo mkarchiso -v -w /tmp/archiso-tmp /root/DotFiles/image/archiso