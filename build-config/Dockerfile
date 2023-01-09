FROM archlinux:latest AS base
RUN echo "Server = https://ricardoalcaraz.dev/archlinux" > /etc/pacman.d/mirrorlist
RUN pacman -Syyu --noconfirm git dotnet-sdk dotnet-runtime

COPY ["id_rsa", "/root/.ssh/id_rsa"]
COPY ["id_rsa.pub", "/root/.ssh/id_rsa.pub"]
