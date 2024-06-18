systemctl stop docker-compose@scrypted
bsdtar --acls --xattrs -cpvaf scrypted-backup.tar --exclude large/* --exclude fast/* /opt/scrypted
systemctl start docker-compose@scrypted
