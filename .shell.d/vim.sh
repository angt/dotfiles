shell_install_vim() (
	set -e
	rm -rf ~/.tmp/vim
	mkdir -p ~/.tmp
	git clone https://github.com/vim/vim --depth 1 ~/.tmp/vim
	cd ~/.tmp/vim
	./configure \
		--prefix="$HOME/.local/usr" \
		--disable-nls \
		--disable-gui
	make install -j"$(nproc)"
)

if command -v vim 1>/dev/null; then
	export VISUAL=vim
	export EDITOR=vim
	alias vi=vim
fi
