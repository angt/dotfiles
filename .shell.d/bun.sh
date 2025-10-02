shell_setup_bun() {
	shell_add_path ~/.bun/bin
}

__shell_install_bun() (
	mkdir -p ~/.tmp
	cd ~/.tmp || return
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
	curl -OsSfL "https://github.com/oven-sh/bun/releases/latest/download/$NAME.zip" &&
	unzip -oq "$NAME.zip" &&
	mv "$NAME/bun" ~/.local/bin/bun &&
	ln -sf ~/.local/bin/bun ~/.local/bin/node
)

shell_install_bun() {
	__shell_install_bun && shell_setup_bun
}

[ -e ~/.bun/bin ] && shell_setup_bun
