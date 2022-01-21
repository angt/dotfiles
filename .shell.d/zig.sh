shell_install_zig() (
	set -e
	VERSION=0.9.0
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	[ "$OS"  = darwin ] && OS=macos
	[ "$ARCH" = amd64 ] && ARCH=x86_64
	NAME=zig-$OS-$ARCH-$VERSION
	mkdir -p ~/.zig ~/.local/bin ~/.local/lib
	rm -rf ~/.zig/$NAME
	rm -rf ~/.local/bin/zig
	rm -rf ~/.local/lib/zig
	curl -sSf https://ziglang.org/download/$VERSION/$NAME.tar.xz | tar -Jxf- -C ~/.zig
	ln -sf ~/.zig/$NAME/zig     ~/.local/bin/zig
	ln -sf ~/.zig/$NAME/lib/zig ~/.local/lib/zig
)
