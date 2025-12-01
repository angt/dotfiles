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

if shell_has_cmd vim; then
	export VISUAL=vim
	export EDITOR=vim
	alias vi=vim
fi
