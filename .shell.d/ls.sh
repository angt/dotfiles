unset LS_COLORS
export CLICOLOR=1

ls --version 2>&1 | grep -sq GNU && alias ls='ls --color=auto'
alias l1='ls -1'
alias ll='ls -l'
alias la='ls -a'
alias lsd='la -d */'
