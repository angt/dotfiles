source ~/.shell.d/go.sh

piknik_install() {
    go get -u github.com/jedisct1/piknik
}

pko() {
    echo "$*" | piknik -copy
}

pkf() {
    piknik -copy < $1
}

alias pkc='piknik -copy'
alias pkp='piknik -paste'
alias pkm='piknik -move'
alias pkz='piknik -copy < /dev/null'
