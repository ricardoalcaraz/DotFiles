alias systemctl='sudo systemctl'
alias scl='sudo systemctl'
alias journalctl='sudo journalctl'
alias scle='sudo systemctl enable'
alias cpr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1'
alias mvr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files'
alias ls='ls --color=auto'
alias wake_huxley='wol 50:eb:f6:7e:d8:d2'

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH=$PATH:/home/ralcaraz/.dotnet/tools

# Lines configured by zsh-newuser-install
EDITOR=/usr/bin/vim
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v