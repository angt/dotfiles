shell_install_totp() {
	mkdir -p ~/.tmp
	cd ~/.tmp || return
	rm -rf totp
	git clone https://github.com/angt/totp --recursive
	cd totp || return
	make prefix=~/.local install
}
