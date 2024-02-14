docker-compose down

bsdtar --acls --xattrs -cpvaf "/data/backups/musicbymalsi.com.tar.gz" /data/websites/musicbymalsi.com
scp /data/backups/musicbymalsi.com.tar.gz root@64.227.109.226:/data/backups/

#upload to another server
#scp musicbymalsi.com.tar.gz root@server:/data/websites/backups/musicbymalsi.com.tar.gz
docker-compose pull
docker-compose up -d