shell_install_ninja() (
	set -e
	[ "$1" ] || set -- "v1.12.1"
	shell_clone_tmp ninja --branch "$1" https://github.com/ninja-build/ninja
	./configure.py --bootstrap
	mv ninja ~/.local/bin
)
