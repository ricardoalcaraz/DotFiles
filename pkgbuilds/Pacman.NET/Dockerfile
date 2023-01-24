FROM registry.digitalocean.com/rar-tech/archlinux:base as build
USER aur-builder
WORKDIR /home/aur-builder
RUN mkdir Pacman.NET
WORKDIR /home/aur-builder/Pacman.NET
COPY ./* ./
RUN sudo pacman -Syu
RUN makepkg -si --noconfirm
USER pacnet
WORKDIR /srv/http/Pacman.NET
EXPOSE 80
ENTRYPOINT [ "/usr/bin/dotnet", "Pacman.NET.dll" ]