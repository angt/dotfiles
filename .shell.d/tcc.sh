shell_install_tcc() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf tinycc
	git clone https://repo.or.cz/tinycc.git
	cd tinycc
	./configure --prefix="$HOME/.local"
	make
	make install
)
