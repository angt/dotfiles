shell_install_zstd() (
	set -e
	rm -rf ~/.tmp/zstd
	mkdir -p ~/.tmp
	git clone https://github.com/facebook/zstd ~/.tmp/zstd
	cd ~/.tmp/zstd
	make install PREFIX=~/.local/usr
)
