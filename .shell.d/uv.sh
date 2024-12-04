[ -d ~/.venv/bin ] && shell_add_path ~/.venv/bin

shell_install_uv() (
	cd
	curl -LsSf https://astral.sh/uv/install.sh | sh
	uv venv
	echo "Need shell_reload"
)
