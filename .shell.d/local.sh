mkdir -p \
	~/.local/usr/bin \
	~/.local/usr/share/man \
	~/.local/usr/lib/pkgconfig \
	~/.local/usr/include

ln -sfn bin         ~/.local/usr/sbin
ln -sfn share/man   ~/.local/usr/man
ln -sfn usr/bin     ~/.local/bin
ln -sfn usr/sbin    ~/.local/sbin
ln -sfn usr/man     ~/.local/man
ln -sfn usr/share   ~/.local/share
ln -sfn usr/lib     ~/.local/lib
ln -sfn usr/include ~/.local/include

shell_add_path ~/.local/bin
shell_add_manpath ~/.local/man
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
