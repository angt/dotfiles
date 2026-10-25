shell_install_glorytun() (
	set -e
	shell_clone_tmp glorytun https://github.com/angt/glorytun
	make DESTDIR=~/.local prefix=/usr install
)
