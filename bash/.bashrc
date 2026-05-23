# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"

alias f='fastfetch'
alias q='exit'
alias cl='clear'
PROMPT_DIRTRIM=3
PS1="\[\e[0m\]\u\[\e[0m\] \[\e[1;31m\]||\[\e[0m\] \[\e[1;32m\]\w\[\e[0m\] \[\e[1;34m\]$\[\e[0m\] "
