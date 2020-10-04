#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

EDITOR="$VISUAL"
export VISUAL=vim
BROWSER=/usr/bin/firefox


alias systemctl='sudo systemctl'
alias journalctl='sudo journalctl'
alias se='ls/usr/bin | grep'
alias huxley='sudo mount -t cifs -o credentials=~/.credentials,uid=1000,gid=1000,dir_mode=0755,file_mode=0755 //HUXLEY/Shared /mnt/hyperv'

function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
} 
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}