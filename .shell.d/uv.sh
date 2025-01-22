shell_setup_uv() {
	shell_add_path ~/.venv/bin
	mkdir -p ~/.tmp
	cat > ~/.tmp/lib.py <<-'EOF'
	import sys
	for path in sys.path:
	    if '/lib/' in path and 'site-packages' not in path:
	        print(path.split('/lib/')[0] + '/lib')
	        break
	EOF
	shell_add_lib_path $(python ~/.tmp/lib.py)
}

shell_install_uv() {
	curl -LsSf https://astral.sh/uv/install.sh | sh &&
	UV_PYTHON_PREFERENCE=only-managed uv venv ~/.venv &&
	shell_setup_uv
}

[ -e ~/.venv ] && shell_setup_uv
