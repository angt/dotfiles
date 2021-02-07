shell_install_wasi() (
	set -e
	VERSION=12.0
	DIR="$HOME/.wasi-sdk-$VERSION"
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	[ "$OS"  = darwin ] && OS=macos
	rm -rf "$DIR"
	curl https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${VERSION%.*}/wasi-sdk-$VERSION-$OS.tar.gz | tar zxf - -C ~
	mv "$HOME/wasi-sdk-$VERSION" "$DIR"
	cat > ~/.local/bin/wasicc <<-EOF
	#!/bin/sh
	exec $DIR/bin/clang --sysroot=$DIR/share/wasi-sysroot "\$@"
	EOF
	chmod +x ~/.local/bin/wasicc
)
