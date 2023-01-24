FROM docker.io/archlinux:latest
RUN pacman -Syu --noconfirm sudo git base-devel openssh vi
RUN useradd -g wheel -m aur-builder
RUN echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/aur-builder
USER aur-builder
WORKDIR /home/aur-builder
#RUN pacman -Syu --noconfirm
