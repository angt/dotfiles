extract() {
    [ -f "$1" ] || return
    case "$1" in
        *.tar.xz)  tar xJf    "$1" ;;
        *.tar.bz2) tar xjf    "$1" ;;
        *.tar.gz)  tar xzf    "$1" ;;
        *.tar)     tar xf     "$1" ;;
        *.txz)     tar xJf    "$1" ;;
        *.tbz2)    tar xjf    "$1" ;;
        *.tgz)     tar xzf    "$1" ;;
        *.gz)      gunzip     "$1" ;;
        *.bz2)     bunzip2    "$1" ;;
        *.rar)     unrar e    "$1" ;;
        *.zip)     unzip      "$1" ;;
        *.Z)       uncompress "$1" ;;
        *.7z)      7z x       "$1" ;;
        *) echo   "Unknown format" ;;
    esac
}
