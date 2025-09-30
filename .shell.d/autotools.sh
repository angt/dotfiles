shell_install_autotools() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf autotools
	mkdir -p autotools
	cd autotools
	for pkg in \
		m4-1.4.20 \
		autoconf-2.72 \
		automake-1.18.1 \
		libtool-2.5.4
	do
		name=${pkg%%-*}
		curl -L "https://ftpmirror.gnu.org/gnu/$name/$pkg.tar.gz" | tar zxf -
		(
			cd $pkg &&
			./configure --prefix="$HOME/.local" &&
			make install -j"$(nproc)"
		)
	done
)
