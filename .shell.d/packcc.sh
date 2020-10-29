shell_install_packcc() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf packcc
	git clone https://github.com/enechaev/packcc
	gcc -O2 -o ~/.local/usr/bin/packcc packcc/packcc.c
)
