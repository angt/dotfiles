shell_add_path ~/.local/vim/bin

shell_install_vim() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf vim
	git clone https://github.com/vim/vim --depth 1
	cd vim
	rm -rf ~/.local/vim
	./configure --prefix="$HOME/.local/vim" \
		--disable-nls \
		--disable-gui
	make -j install
)

command -v vim 1>/dev/null 2>/dev/null || return

export VISUAL=vim
export EDITOR=vim

alias vi=vim
