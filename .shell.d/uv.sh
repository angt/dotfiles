shell_setup_uv() {
	shell_add_path ~/.venv/bin
}

shell_install_uv() {
	curl -LsSf https://astral.sh/uv/install.sh | sh &&
	UV_PYTHON_PREFERENCE=only-managed uv venv ~/.venv &&
	shell_setup_uv
}

[ -e ~/.venv ] && shell_setup_uv
