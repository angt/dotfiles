shell_install_musl() {
	git clone https://github.com/richfelker/musl-cross-make
	cd musl-cross-make || return
	for i in x86_64-linux-musl aarch64-linux-musl i686-linux-musl; do
		make -j TARGET=$i OUTPUT=~/.local install
	done
}
