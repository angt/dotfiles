shell_install_tcc() (
	set -e
	rm -rf ~/.tmp/tinycc
	mkdir -p ~/.tmp
	git clone https://repo.or.cz/tinycc.git ~/.tmp/tinycc
	cd ~/.tmp/tinycc
	./configure --prefix="$HOME/.local/usr"
	make install -j"$(nproc)"
)
