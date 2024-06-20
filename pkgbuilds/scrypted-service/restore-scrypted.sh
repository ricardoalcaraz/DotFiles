bsdtar --acls --xattrs -xpzf /opt/backups/scrypted/scrypted-backup.tar -C /
rsync -a --info=progress2 camus.local:/volume2/backups/scrypted/fast /opt/scrypted/