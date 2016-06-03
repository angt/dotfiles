[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend

PS1='[\u@\h \W]\$ '

[ -f ~/.shell ] && source ~/.shell
