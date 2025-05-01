shell_install_secret() (
	[ "$1" ] || set -- "v0.13"
	URL="https://github.com/angt/secret/releases/download"
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS" = darwin ] && OS=macos
	case "$ARCH" in
	(amd64) ARCH=x86_64 ;;
	(arm64) ARCH=aarch64 ;;
	esac
	curl -sSf "$URL/$1/secret-$ARCH-$OS.gz" | gunzip > ~/.local/bin/secret
	chmod +x ~/.local/bin/secret
)
