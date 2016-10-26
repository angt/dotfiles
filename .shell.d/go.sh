DIR=go1.7.3

export GOROOT=~/.${DIR}
export GOPATH=${GOPATH:-~/.go}

shell_add_path "$GOROOT/bin"
shell_add_path "$GOPATH/bin"

go_install() {
    curl https://storage.googleapis.com/golang/${DIR}.linux-amd64.tar.gz | tar xz -C ${GOROOT} --strip-components=1
}
