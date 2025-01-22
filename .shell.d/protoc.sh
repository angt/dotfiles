shell_install_protoc() (
	[ "$1" ] || set -- "29.3"
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	#rm -rf encpipe
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS"  = darwin ] && OS=osx
	case "$ARCH" in
		(amd64)         ARCH=x86_64 ;;
		(aarch64|arm64) ARCH=aarch_64 ;;
	esac
	NAME="protoc-$1-$OS-$ARCH"
	URL="https://github.com/protocolbuffers/protobuf/releases/download"
	[ -e "$NAME.zip" ] || curl -LO -sSf "$URL/v$1/$NAME.zip"
	unzip "$NAME.zip" -d $HOME/.local
)
