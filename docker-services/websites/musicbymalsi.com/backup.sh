docker-compose down

sudo bsdtar --acls --xattrs -cpvaf "musicbymalsi.com.tar.gz" /data/websites/musicbymalsi.com

#upload to another server
#scp musicbymalsi.com.tar.gz root@server:/data/websites/backups/musicbymalsi.com.tar.gz
docker-compose pull
docker-compose up -d