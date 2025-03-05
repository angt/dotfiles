shell_setup_zig() {
	[ "$1" ] && echo "$1" > ~/.zig/version
	[ -e ~/.zig/version ] &&
	shell_add_path ~/.zig/"$(cat ~/.zig/version)"
}

shell_install_zig() {
	[ "$1" ] || set -- "0.14.0"
	[ -e ~/zig/"$1" ] || (
		set -e
		OS=$(uname -s | tr '[:upper:]' '[:lower:]')
		ARCH=$(uname -m)
		[ "$OS"  = darwin ] && OS=macos
		case "$ARCH" in
		(amd64) ARCH=x86_64 ;;
		(arm64) ARCH=aarch64 ;;
		esac
		NAME="zig-$OS-$ARCH-$1"
		case "$1" in
		(*-dev.*) DIR="builds" ;;
		(*)       DIR="download/$1" ;;
		esac
		mkdir -p ~/.zig
		rm -rf ~/.zig/"$NAME" ~/.zig/"$1"
		curl -sS \
			-f "https://ziglang.org/$DIR/$NAME.tar.xz" \
			-f "https://pkg.machengine.org/zig/$NAME.tar.xz" |
				tar -Jxf- -C ~/.zig &&
		mv ~/.zig/"$NAME" ~/.zig/"$1"
	)
	shell_setup_zig "$1"
}

[ -e ~/.zig ] && shell_setup_zig
