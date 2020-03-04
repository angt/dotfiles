VERSION=1.14
OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=amd64
DIR=go$VERSION
TGZ=$DIR.$OS-$ARCH.tar.gz

export GOROOT="$HOME/.$DIR"
export GOPATH="${GOPATH:-$HOME/.go}"

shell_add_path "$GOROOT/bin"
shell_add_path "$GOPATH/bin"

shell_install_go() {
    curl -sSf "https://dl.google.com/go/$TGZ" | tar xz -C "$GOROOT" --strip-components=1
}
