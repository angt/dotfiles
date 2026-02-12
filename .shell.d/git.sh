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
