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
