shell_install_shellcheck() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	V="v0.10.0"
	OS="$(uname | tr '[:upper:]' '[:lower:]')"
	ARCH="$(uname -m)"
	case "$ARCH" in
	(arm64) ARCH=aarch64 ;;
	esac
	URL="https://github.com/koalaman/shellcheck/releases/download/$V/shellcheck-$V.$OS.$ARCH.tar.xz"
	curl -sSf "$URL" | tar -xJf -
	mv -f "shellcheck-$V/shellcheck" "$HOME/.local/bin"
)
