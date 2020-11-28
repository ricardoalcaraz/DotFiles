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
alias scl='sudo systemctl'
alias journalctl='sudo journalctl'

function cpr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
} 
function mvr() {
  rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files "$@"
}