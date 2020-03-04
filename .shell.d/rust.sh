shell_add_path ~/.cargo/bin

shell_install_rustup() {
	curl -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
}
