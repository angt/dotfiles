VERSION=1.7.3
OS=`uname | tr [:upper:] [:lower:]`
ARCH=amd64
DIR=go${VERSION}
TGZ=${DIR}.${OS}-${ARCH}.tar.gz

export GOROOT=~/.${DIR}
export GOPATH=${GOPATH:-~/.go}

shell_add_path "${GOROOT}/bin"
shell_add_path "${GOPATH}/bin"

go_install() {
    curl https://storage.googleapis.com/golang/${TGZ} | tar xz -C ${GOROOT} --strip-components=1
}
