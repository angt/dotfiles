shell_setup_uv() {
	shell_add_path ~/.venv/bin
	shell_add_lib_path "$(~/.venv/bin/python -c 'import sys; print(sys.base_exec_prefix + "/lib")')"
}

shell_install_uv() {
	[ "$1" ] || set -- "3.12"
	curl -LsSf https://astral.sh/uv/install.sh | sh &&
	UV_PYTHON_PREFERENCE=only-managed uv venv -p "$1" --clear ~/.venv &&
	shell_setup_uv
}

[ -x ~/.venv/bin/python ] && shell_setup_uv
