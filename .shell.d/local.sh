shell_add_path ~/.local/bin
shell_add_path ~/.local/sbin
shell_add_path ~/.local/usr/bin
shell_add_path ~/.local/usr/sbin

shell_add_manpath ~/.local/usr/man
shell_add_manpath ~/.local/usr/share/man

shell_add_lib_path ~/.local/lib

shell_setup_local_dev() {
	export PKG_CONFIG_PATH=~/.local/lib/pkgconfig
	export LIBRARY_PATH=~/.local/lib
	export CPATH=~/.local/include
}

shell_cleanup_local_dev() {
	unset PKG_CONFIG_PATH LIBRARY_PATH CPATH
}

shell_setup_local_dev
