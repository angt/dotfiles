shell_install_libressl() (
	set -e
	rm -rf ~/.tmp/libressl
	mkdir -p ~/.tmp
	git clone https://github.com/libressl/portable --depth 1 ~/.tmp/libressl
	cd ~/.tmp/libressl
	./autogen.sh
	./configure --prefix="$HOME/.local/usr"
	make install -j"$(nproc)"
)
