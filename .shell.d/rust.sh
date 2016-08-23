shell_add_path ~/.cargo/bin

rust_install() {
    curl -sSf https://sh.rustup.rs | sh -s -- --no-modify-path
}
