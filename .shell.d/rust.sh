shell_setup_rust() {
	shell_add_path ~/.cargo/bin
}

shell_install_rust() {
	if shell_has_cmd rustup
	then rustup update
	else curl -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
	fi &&
	shell_setup_rust
}

[ -e ~/.cargo/bin ] && shell_setup_rust
