shell_install_git() (
	[ "$1" ] || set -- "2.53.0"
	set -e
	rm -rf ~/.tmp/git-*
	mkdir -p ~/.tmp
	curl -L "https://www.kernel.org/pub/software/scm/git/git-$1.tar.gz" |
		tar zxf - -C ~/.tmp
	cd ~/.tmp/"git-$1"
	make configure
	./configure --prefix="$HOME/.local/usr"
	make install -j"$(nproc)"
)

shell_git() {
	git -C "$HOME" \
		--git-dir="$HOME/.shell.git" \
		--work-tree="$HOME" "$@"
}

case "$(shell_git remote get-url origin)" in
(https://*) shell_git remote set-url origin gh:angt/dotfiles
esac
