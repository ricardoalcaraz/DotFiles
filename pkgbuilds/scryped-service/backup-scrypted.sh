systemctl stop docker-compose@scrypted.service 
bsdtar --acls --xattrs -cpvaf /opt/backups/scrypted-backup.tar --exclude large/* --exclude fast/* /opt/scrypted
systemctl start docker-compose@scrypted.service 