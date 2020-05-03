shell_install_secret() {
	mkdir -p ~/.tmp
	cd ~/.tmp || return
	rm -rf secret
	git clone https://github.com/angt/secret --recursive
	cd secret || return
	make prefix=~/.local install
	cp -f argz/argz.sh ~/.shell.d/argz.bash
	shell_reload
}
