FROM registry.digitalocean.com/rar-tech/archlinux:latest
USER aur-builder
WORKDIR /home/aur-builder
RUN sudo pacman -Syu --noconfirm

#RUN echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/aur-builder
#RUN useradd -g wheel -m aur-builder

#
#RUN sudo pacman -Syu
#RUN pacman -Syu --noconfirm
