export GOROOT="$HOME/.goroot/go"
export GOPATH="$HOME/.go"
export GO111MODULE="on"

shell_add_path "$GOROOT/bin"
shell_add_path "$GOPATH/bin"

shell_install_go() (
	set -e
	VERSION=1.15.6
	OS=$(uname | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$ARCH" = x86_64 ] && ARCH=amd64
	TGZ=go$VERSION.$OS-$ARCH.tar.gz
	rm -rf "${GOROOT%/go}"
	mkdir -p "${GOROOT%/go}"
	curl -sSf "https://dl.google.com/go/$TGZ" | tar -xzf - -C "${GOROOT%/go}"
)
