alias systemctl='sudo systemctl'
alias scl='sudo systemctl'
alias journalctl='sudo journalctl'
alias scle='sudo systemctl enable'
alias cpr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1'
alias mvr='rsync --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 --remove-source-files'
alias ls='ls --color=auto'
alias wake_huxley='wol 50:eb:f6:7e:d8:d2'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Lines configured by zsh-newuser-install
EDITOR=/usr/bin/vim
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

prompt walters
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'