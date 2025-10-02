shell_install_glorytun() (
	set -e
	rm -rf ~/.tmp/glorytun
	mkdir -p ~/.tmp
	git clone https://github.com/angt/glorytun --recursive ~/.tmp/glorytun
	cd ~/.tmp/glorytun
	make -C glorytun DESTDIR=~/.local prefix=/usr install
)
