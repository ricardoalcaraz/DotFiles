typeset -U path PATH
path=(~/.dotnet/tools $path)
export PATH
export DOCKER_HOST="unix:///var/run/docker.sock"
export DOCKER_BUILDKIT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export SYSTEMD_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
