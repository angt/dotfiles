source ~/.shell.d/go.sh

shell_install_piknik() {
    go get -u github.com/jedisct1/piknik
}

shell_setup_piknik() {
    if [ ! -f ~/.piknik.toml ]; then
        printf 'Password: '
        piknik -genkeys -password | sed -n '/Hybrid/,//p' | sed 's/Connect.*/Connect = "137.74.24.37:8075"/' > ~/.piknik.toml
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
