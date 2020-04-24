shell_install_secret() {
	mkdir -p ~/.tmp
	cd ~/.tmp || return
	git clone https://github.com/angt/secret --recursive
	cd secret || return
	make prefix=~/.local install
	cp -f argz/argz.sh ~/.shell.d
	shell_reload
}

complete -F _argz secret
