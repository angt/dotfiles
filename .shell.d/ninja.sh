shell_install_ninja() (
	set -e
	[ "$1" ] || set -- "v1.12.1"
	rm -rf ~/.tmp/ninja
	mkdir -p ~/.tmp
	git clone --branch "$1" https://github.com/ninja-build/ninja ~/.tmp/ninja
	cd ~/.tmp/ninja
	./configure.py --bootstrap
	mv ninja ~/.local/bin
)
