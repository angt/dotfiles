shell_install_shellcheck() (
	[ "$1" ] || set -- "0.11.0"
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	OS="$(uname | tr '[:upper:]' '[:lower:]')"
	ARCH="$(uname -m)"
	case "$ARCH" in
	(amd64) ARCH=x86_64 ;;
	(arm64) ARCH=aarch64 ;;
	esac
	URL="https://github.com/koalaman/shellcheck/releases/download/v$1/shellcheck-v$1.$OS.$ARCH.tar.xz"
	curl -sSf "$URL" | tar -xJf -
	mv -f "shellcheck-v$1/shellcheck" "$HOME/.local/bin"
)
