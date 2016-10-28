tf() {
    [ -f "$1" ] && curl -T "$1" https://transfer.sh/"`basename $1`"
}

tfz() {
    # dont tar | curl
    [ -e "$1" ] && tar czf "$1".tgz "$1" && curl -T "$1".tgz https://transfer.sh/"`basename $1`".tgz
}
