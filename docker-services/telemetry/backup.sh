docker-compose down

tar -czvf telemetry-containers.tar.gz /data/websites/telemetry-containers
#upload to another server
scp telemetry-containers.tar.gz root@server:/data/backups/telemetry-containers.tar.gz

docker-compose pull
docker-compose up -d