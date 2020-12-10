shell_add_path ~/.cargo/bin

shell_install_rustup() {
	if command -v rustup >/dev/null; then
		rustup update
	else
		curl -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
	fi
}
