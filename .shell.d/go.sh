shell_setup_go() {
	export GOROOT="$HOME/.goroot/go"
	export GOPATH="$HOME/.go"
	export GO111MODULE="on"
	shell_add_path "$GOROOT/bin"
	shell_add_path "$GOPATH/bin"
}

__shell_install_go() (
	OS=$(uname | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	case "$ARCH" in
	(x86_64)  ARCH=amd64 ;;
	(aarch64) ARCH=arm64 ;;
	esac
	GO="go$1.$OS-$ARCH"
	rm -rf ~/.goroot
	mkdir -p ~/.goroot &&
	curl -sSf "https://dl.google.com/go/$GO.tar.gz" |
		tar -xzf - -C ~/.goroot
)

shell_install_go() {
	[ "$1" ] || set -- "1.26.0"
	__shell_install_go "$1" && shell_setup_go
}

[ -e ~/.goroot/go ] && shell_setup_go
