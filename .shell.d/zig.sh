shell_setup_zig() {
	[ "$1" ] && echo "$1" > ~/.zig/version
	[ -e ~/.zig/version ] &&
	shell_add_path ~/.zig/"$(cat ~/.zig/version)"
}

shell_install_zig() {
	[ "$1" ] || set -- "0.15.1"
	[ -e ~/zig/"$1" ] || (
		OS=$(uname -s | tr '[:upper:]' '[:lower:]')
		ARCH=$(uname -m)
		[ "$OS" = darwin ] && OS=macos
		case "$ARCH" in
		(amd64) ARCH=x86_64 ;;
		(arm64) ARCH=aarch64 ;;
		esac
		case "$1" in
		(*-dev.*) DIR="builds" ;;
		(*)       DIR="download/$1" ;;
		esac
		mkdir -p ~/.zig
		rm -rf ~/.zig/"$1"
		curl -sS \
			-f "https://ziglang.org/$DIR/zig-$OS-$ARCH-$1.tar.xz" \
			-f "https://ziglang.org/$DIR/zig-$ARCH-$OS-$1.tar.xz" \
			-f "https://pkg.machengine.org/zig/zig-$OS-$ARCH-$1.tar.xz" |
			tar -Jxf- -C ~/.zig &&
		mv ~/.zig/zig-*-"$1" ~/.zig/"$1"
	)
	shell_setup_zig "$1"
}

[ -e ~/.zig ] && shell_setup_zig
