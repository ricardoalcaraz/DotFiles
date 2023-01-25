FROM registry.digitalocean.com/rar-tech/archlinux:latest
ARG APP_NAME
RUN mkdir ${APP_NAME}
WORKDIR /home/aur-builder/${APP_NAME}
COPY ./* ./
RUN sudo pacman -Syu --noconfirm dotnet-sdk dotnet-runtime aspnet-runtime
RUN git clone git@github.com:ricardoalcaraz/ricardoalcaraz.dev.git
RUN makepkg -sf --noconfirm
RUN scp ${APP_NAME}-* droplet:/srv/http/uploads