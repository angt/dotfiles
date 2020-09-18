shell_install_secret() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf secret
	git clone https://github.com/angt/secret -b totp --recursive
	make -C secret CFLAGS="-Wall -O2 -march=native" DESTDIR=~/.local prefix=/usr install
)
