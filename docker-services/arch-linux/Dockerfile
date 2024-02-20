FROM docker.io/archlinux:latest
RUN echo "Server = https://ricardoalcaraz.dev/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm certbot certbot-dns-digitalocean