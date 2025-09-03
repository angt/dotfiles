shell_install_cmake() (
	set -e
	[ "$1" ] || set -- "4.1.1"
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf CMake
	git clone --branch "v$1" https://github.com/Kitware/CMake
	cd CMake
	./bootstrap --prefix="$HOME/.local" --parallel=$(nproc)
	make -j$(nproc) install
)
