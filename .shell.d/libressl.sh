shell_install_libressl() (
	set -e
	shell_clone_tmp libressl https://github.com/libressl/portable
	./autogen.sh
	./configure --prefix="$HOME/.local/usr"
	make install -j"$(nproc)"
)
