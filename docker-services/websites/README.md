# Websites

ricardoalcaraz.dev
musicbymalsi.com
adlibs.ai
madlibs.ai

## Setup

Websites run inside docker containers and backed up daily to prevent outages. Health checks are done through the cloud at digitalocean.com

### musicmymalsi.com

Hosted locally and in DigitalOcean. The local version runs through a docker compose file with wordpress and mysql. 
Data is saved to /data/websites/musicbymalsi.com and backed up daily

```yaml
services:
  wordpress:
    image: wordpress:latest
    container_name: musicbymalsi-wordpress
    restart: always
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: $WORDPRESS_DB_PASSWORD
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - /data/websites/musicbymalsi.com/wordpress:/var/www/html
    ports:
      - 8080:80
  db:
    image: mysql:5.7
    container_name: musicbymalsi-db
    restart: always
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: WORDPRESS_DB_PASSWORD
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - /data/websites/musicbymalsi.com/mysql:/var/lib/mysql
```

### Backups

Backing up docker containers is done through the backup.sh script pointing at a particular directory