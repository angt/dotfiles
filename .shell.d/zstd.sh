shell_install_zstd() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf zstd
	git clone https://github.com/facebook/zstd
	cd zstd
	make install PREFIX=~/.local
)
