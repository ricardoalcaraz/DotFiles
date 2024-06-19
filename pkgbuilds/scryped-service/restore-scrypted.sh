bsdtar --acls --xattrs -xpzf /opt/backups/scrypted-backup.tar -C /
rsync -a /opt/backups/scrypted-low-res/ /opt/scrypted/fast