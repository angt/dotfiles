unset LS_COLORS
export CLICOLOR=1

ls --color=auto &>/dev/null && \
    alias ls='ls --color=auto'

alias l='ls --group-directories-first'
alias l1='ls -1'
alias lS='ls -LrsS'
alias ll='ls -l'
alias lA='ls -A'
alias la='ls -a'
alias lr='ls -R'
alias llS='ll -rS'
alias lla='la -l'
alias lsd='la -d */'
