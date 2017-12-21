# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[$(tput bold)\]\[$(tput setaf 12)\]\W \[$(tput setaf 10)\]❱ \[$(tput sgr0)\]'

set -o vi
