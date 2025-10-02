shell_install_cmake() (
	set -e
	[ "$1" ] || set -- "4.1.2"
	rm -rf ~/.tmp/cmake
	mkdir -p ~/.tmp
	git clone --branch "v$1" https://github.com/Kitware/CMake ~/.tmp/cmake
	cd ~/.tmp/cmake
	./bootstrap --prefix="$HOME/.local" --parallel=$(nproc)
	make -j$(nproc) install
)
