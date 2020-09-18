shell_install_encpipe() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf encpipe
	git clone https://github.com/jedisct1/encpipe --recursive
	make -C encpipe PREFIX=~/.local install
)
