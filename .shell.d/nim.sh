shell_add_path ~/.nimble/bin

shell_install_nim() {
	if command -v choosenim >/dev/null; then
		choosenim update stable
	else
		curl -sSf https://nim-lang.org/choosenim/init.sh -sSf | sh
	fi
}
