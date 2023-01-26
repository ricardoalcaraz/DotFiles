
#make wildcard dns note that it needs credentials
certbot certonly --dns-digitalocean --dns-digitalocean-credentials ~/certbot-creds.ini -d '*.ricardoalcaraz.dev' --agree-tos -m mail@ricardoalcaraz.dev