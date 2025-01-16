shell_setup_deno() {
	shell_add_path ~/.deno/bin
}

shell_install_deno() {
	curl -fsSL https://deno.land/x/install/install.sh | sh &&
	shell_setup_deno
}

[ -e ~/.deno ] && shell_setup_deno
