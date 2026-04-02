shell_install_bucketboard() (
	rm -rf ~/.tmp/bucketboard
	mkdir -p ~/.tmp &&
	git clone https://github.com/angt/bucketboard --depth 1 ~/.tmp/bucketboard &&
	cd ~/.tmp/bucketboard &&
	zig build install --prefix ~/.local
)
