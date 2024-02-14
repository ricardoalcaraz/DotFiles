#FILE_BACKUP=/data/backups/archlinux-packages.tar.gz
FILE_BACKUP=/data/backups/archlinux-packages.tar.bz2
echo "Backing up to $FILE_BACKUP"
#bsdtar --acls --xattrs -cpvaf $FILE_BACKUP /data/archlinux
bsdtar -cvf $FILE_BACKUP -I pbzip2 /data/archlinux
scp $FILE_BACKUP root@64.227.109.226:/data/backups/

#upload to another server
#scp musicbymalsi.com.tar.gz root@server:/data/websites/backups/musicbymalsi.com.tar.gz