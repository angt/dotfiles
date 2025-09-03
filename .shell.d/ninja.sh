shell_install_ninja() (
	set -e
	[ "$1" ] || set -- "v1.12.1"
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf ninja
	git clone --branch "$1" https://github.com/ninja-build/ninja
	cd ninja
	./configure.py --bootstrap
	mv ninja ~/.local/bin
)
