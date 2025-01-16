shell_setup_wasmer() {
	export WASMER_DIR="$HOME/.wasmer"
	export WASMER_CACHE_DIR="$WASMER_DIR/cache"

	shell_add_path "$WASMER_DIR/globals/wapm_packages/.bin"
	shell_add_path "$WASMER_DIR/bin"
}

shell_install_wasmer() {
	curl https://get.wasmer.io -sSfL | sh &&
	shell_setup_wasmer
}

[ -e ~/.wasmer ] && shell_setup_wasmer
