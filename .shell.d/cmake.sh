shell_install_cmake() (
	set -e
	[ "$1" ] || set -- "4.2.3"
	shell_clone_tmp cmake --branch "v$1" https://github.com/Kitware/CMake
	./bootstrap --prefix="$HOME/.local/usr" --parallel="$(nproc)"
	make -j"$(nproc)" install
)
