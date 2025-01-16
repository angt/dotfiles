shell_setup_vim() {
	shell_add_path ~/.vimroot/bin
	shell_add_manpath ~/.vimroot/share/man
}

shell_install_vim() {
	(
		set -e
		rm -rf ~/.vimroot ~/.tmp/vim
		mkdir -p ~/.tmp
		git clone https://github.com/vim/vim --depth 1 ~/.tmp/vim
		cd ~/.tmp/vim
		./configure \
			--prefix="$HOME/.vimroot" \
			--disable-nls \
			--disable-gui
		make -j install
	) &&
	shell_setup_vim
}

[ -e ~/.vimroot ] && shell_setup_vim

command -v vim 1>/dev/null || return

export VISUAL=vim
export EDITOR=vim

alias vi=vim
