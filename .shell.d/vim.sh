shell_install_vim() (
	set -e
	shell_clone_tmp vim https://github.com/vim/vim
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
