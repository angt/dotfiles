shell_install_encpipe() {
	mkdir -p ~/.tmp
	cd ~/.tmp || return
	rm -rf encpipe
	git clone https://github.com/jedisct1/encpipe --recursive
	cd encpipe || return
	make PREFIX=~/.local install
}
