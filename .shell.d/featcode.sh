shell_install_featcode() (
	[ "$1" ] || set -- "v3"
	URL="https://github.com/angt/featcode/releases/download"
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS" = darwin ] && OS=macos
	case "$ARCH" in
	(amd64) ARCH=x86_64 ;;
	(arm64) ARCH=aarch64 ;;
	esac
	curl -sSf "$URL/$1/$ARCH-$OS-featcode" > ~/.local/bin/featcode
	chmod +x ~/.local/bin/featcode
)
