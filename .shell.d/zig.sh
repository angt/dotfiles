shell_setup_zig() {
	[ "$1" ] && ln -sf ~/.zig/zig-*-"$1"/zig ~/.local/bin/zig
}

__shell_install_zig() (
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS" = darwin ] && OS=macos
	case "$ARCH" in
	(amd64) ARCH=x86_64 ;;
	(arm64) ARCH=aarch64 ;;
	esac
	ZIG="zig-$ARCH-$OS-$1"
	[ -x ~/.zig/"$ZIG"/zig ] && return
	rm -rf ~/.zig/"$ZIG"
	mkdir -p ~/.zig &&
	curl -sSf "https://zigmirror.com/$ZIG.tar.xz" |
		tar -Jxf - -C ~/.zig
)

shell_install_zig() {
	[ "$1" ] || set -- "0.15.2"
	__shell_install_zig "$1" && shell_setup_zig "$1"
}
