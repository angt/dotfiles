shell_add_path ~/.nimble/bin

shell_install_nim() {
	curl -sSf https://nim-lang.org/choosenim/init.sh -sSf | sh
}
