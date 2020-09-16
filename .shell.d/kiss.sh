export KISS_PATH="$HOME/.kiss/repo/core:$HOME/.kiss/repo/extra:$HOME/.kiss/community/community"
export KISS_ROOT="$HOME/.local"

shell_install_kiss() {
	rm -rf ~/.kiss
	mkdir -p ~/.kiss
	cd ~/.kiss || return
	git clone ghh:kisslinux/kiss
	git clone ghh:kisslinux/repo
	git clone ghh:kisslinux/community
	cp -f kiss/kiss kiss/contrib/* ~/.local/bin
	rm -rf kiss
}
