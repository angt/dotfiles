shell_install_glorytun() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf glorytun
	git clone https://github.com/angt/glorytun --recursive
	make -C glorytun DESTDIR=~/.local prefix=/usr install
)
