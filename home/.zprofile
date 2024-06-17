
# Add .NET Core SDK tools

alias ssh-iso='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@archiso.local'
alias mount-camus='mount --mkdir -t cifs //camus.local/backups /camus/backups -o "credentials=/etc/samba/credentials/share,workgroup=WORKGROUP,iocharset=utf8,uid=ralcaraz,gid=ralcaraz"'

ssh-no-check(){
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$@"
}

cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
} 
mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}