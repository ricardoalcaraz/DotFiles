typeset -U path PATH
path=(~/.dotnet/tools $path)
export PATH
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export DOTNET_CLI_TELEMETRY_OPTOUT=1