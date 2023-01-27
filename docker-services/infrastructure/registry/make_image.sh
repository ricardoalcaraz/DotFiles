docker build -t registry.ricardoalcaraz.dev/registry:latest ./
docker run -p 80:80 -p 443:443 -it -v ~/.local/registry:/var/lib/registry registry.ricardoalcaraz.dev/registry:latest 