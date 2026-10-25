shell_install_zstd() (
	set -e
	shell_clone_tmp zstd https://github.com/facebook/zstd
	make install PREFIX=~/.local/usr
)
