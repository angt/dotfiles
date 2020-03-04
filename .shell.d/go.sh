VERSION=1.14
OS=$(uname | tr '[:upper:]' '[:lower:]')
TGZ=go$VERSION.$OS-amd64.tar.gz

export GOROOT="$HOME/.goroot"
export GOPATH="$HOME/.go"

shell_add_path "$GOROOT/bin"
shell_add_path "$GOPATH/bin"

shell_install_go() {
	rm -rf "$GOROOT"
	mkdir -p "$GOROOT"
	curl -sSf "https://dl.google.com/go/$TGZ" | tar xz -C "$GOROOT" --strip-components=1
}
