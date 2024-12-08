shell_install_zig() (
	set -e
	VERSION=${1-"0.13.0"}
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS"  = darwin ] && OS=macos
	case "$ARCH" in
	(amd64) ARCH=x86_64 ;;
	(arm64) ARCH=aarch64 ;;
	esac
	NAME="zig-$OS-$ARCH-$VERSION"
	rm -rf ~/.local/bin/zig
	rm -rf ~/.local/lib/zig
	if [ ! -e ~/.zig/"$NAME"/zig ]; then
		mkdir -p ~/.zig ~/.local/bin ~/.local/lib
		case "$VERSION" in
		(*-dev.*) DIR="builds" ;;
		(*)       DIR="download/$VERSION" ;;
		esac
		curl -sS \
			-f "https://ziglang.org/$DIR/$NAME.tar.xz" \
			-f "https://pkg.machengine.org/zig/$NAME.tar.xz" |
			tar -Jxf- -C ~/.zig
	fi
	ln -sf ~/.zig/"$NAME"/zig     ~/.local/bin/zig
	ln -sf ~/.zig/"$NAME"/lib/zig ~/.local/lib/zig
)
