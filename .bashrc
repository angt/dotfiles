[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend

[ -f ~/.shell ] && source ~/.shell
