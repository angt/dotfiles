shell_setup_zig() {
	[ "$1" ] && ln -sfn ~/.zig/zig-*-"$1" ~/.zig/current
	shell_add_path ~/.zig/current
}

__shell_install_zig() (
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS" = darwin ] && OS=macos
	case "$ARCH" in
		(amd64) ARCH=x86_64 ;;
		(arm64) ARCH=aarch64 ;;
	esac
	mkdir -p ~/.zig
	rm -rf ~/.zig/zig-*-"$1"
	curl -sSf "https://ziglang.org/download/$1/zig-$ARCH-$OS-$1.tar.xz" |
		tar -Jxf- -C ~/.zig
)

shell_install_zig() {
	[ "$1" ] || set -- "0.15.2"
	__shell_install_zig "$1" && shell_setup_zig "$1"
}

[ -e ~/.zig/current ] && shell_setup_zig
