docker pull registry.digitalocean.com/rar-tech/archlinux:latest
docker build -t registry.digitalocean.com/rar-tech/archlinux:latest ./
docker image push registry.digitalocean.com/rar-tech/archlinux:latest
#docker run -it -p 8080:80 -v ~/.local/Pacman.NET/cache:/srv/http/Pacman.NET/cache pacman-net