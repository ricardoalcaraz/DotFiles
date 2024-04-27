
eval "$(/opt/homebrew/bin/brew shellenv)"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/nelaflowers/.dotnet/tools"

alias ssh-iso='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@archiso.local'

ssh-no-check(){
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$@"
}

cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
} 
mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}