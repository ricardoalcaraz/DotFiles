#docker build -t registry.ricardoalcaraz.dev/registry:latest ./
docker build -t registry.digitalocean.com/rar-tech/registry:s3 ./
docker image push registry.digitalocean.com/rar-tech/registry:s3
#docker run -p 80:80 -p 443:443 -it -v ~/.local/registry:/var/lib/registry registry.ricardoalcaraz.dev/registry:latest 