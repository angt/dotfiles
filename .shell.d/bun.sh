shell_install_bun() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	case "$ARCH" in
	(x86_64)
		ARCH=x64
		case "$OS" in
		(darwin) sysctl machdep.cpu | grep -sq AVX2 ;;
		(linux)  grep -sq avx2 /proc/cpuinfo ;;
		esac && ARCH="$ARCH-baseline" ;;
	(arm64) ARCH=aarch64 ;;
	esac
	NAME="bun-$OS-$ARCH"
	URL="https://github.com/oven-sh/bun/releases/latest/download"
	curl -OsSfL "$URL/$NAME.zip"
	unzip -oq "$NAME.zip"
	mv "$NAME/bun" ~/.local/bin/bun
)
