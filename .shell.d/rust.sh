shell_setup_rust() {
	shell_add_path ~/.cargo/bin
}

shell_install_rust() {
	if command -v rustup >/dev/null
	then rustup update
	else curl -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
	fi &&
	shell_setup_rust
}

[ -e ~/.cargo ] && shell_setup_rust
