shell_install_bucketboard() (
	shell_clone_tmp bucketboard https://github.com/angt/bucketboard &&
	zig build install --prefix ~/.local
)
