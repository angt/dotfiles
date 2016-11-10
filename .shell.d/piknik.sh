source ~/.shell.d/go.sh

piknik_install() {
    go get -u github.com/jedisct1/piknik
}

piknik_setup() {
    if [ ! -f ~/.piknik.toml ]; then
        printf 'Password: '
        piknik -genkeys -password | sed -n '/Hybrid/,//p' > ~/.piknik.toml
    fi
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
