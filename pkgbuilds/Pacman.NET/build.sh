docker pull registry.digitalocean.com/rar-tech/archlinux:latest
docker build --build-arg APP_NAME=Pacman.NET -t registry.digitalocean.com/rar-tech/pacman-net:latest ./
#docker image push registry.digitalocean.com/rar-tech/pacman-net:latest
#docker run -it registry.digitalocean.com/rar-tech/pacman-net:latest