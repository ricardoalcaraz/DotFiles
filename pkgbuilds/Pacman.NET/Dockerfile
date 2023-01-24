FROM registry.digitalocean.com/rar-tech/archlinux:latest
ARG APP_NAME
RUN mkdir ${APP_NAME}
WORKDIR /home/aur-builder/${APP_NAME}
COPY ./* ./
#RUN sudo pacman -Syu --noconfirm
RUN makepkg -sf --noconfirm
RUN scp ${APP_NAME}-* droplet:/srv/http/uploads
#USER pacnet
#WORKDIR /srv/http/${APP_NAME}
#EXPOSE 80
#ENTRYPOINT [ "/usr/bin/dotnet", "${APP_NAME}.dll" ]
#RUN rsync ./${APP_NAME}*.zst 