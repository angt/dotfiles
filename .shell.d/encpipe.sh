shell_install_encpipe() (
	set -e
	shell_clone_tmp encpipe https://github.com/jedisct1/encpipe
	make PREFIX=~/.local install
)
