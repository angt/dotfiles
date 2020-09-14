export GOROOT="$HOME/.goroot"
export GOPATH="$HOME/.go"

shell_add_path "$GOROOT/bin"
shell_add_path "$GOPATH/bin"

shell_install_go() {
	VERSION=1.15.2
	OS=$(uname | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$ARCH" = x86_64 ] && ARCH=amd64
	TGZ=go$VERSION.$OS-$ARCH.tar.gz
	rm -rf "$GOROOT"
	mkdir -p "$GOROOT"
	curl -sSf "https://dl.google.com/go/$TGZ" | tar -xzf - -C "$GOROOT" --strip-components=1
}
