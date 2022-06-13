typeset -U path PATH
path=(~/.dotnet/tools $path)
export PATH
export DOCKER_HOST="unix:///var/run/docker.sock"
export DOTNET_CLI_TELEMETRY_OPTOUT=1