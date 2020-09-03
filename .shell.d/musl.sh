shell_install_musl() {
	mkdir -p ~/.tmp
	cd ~/.tmp || return
	rm -rf musl-cross-make
	git clone https://github.com/richfelker/musl-cross-make
	cd musl-cross-make || return
	> config.mak
	command -v curl   2>/dev/null && echo "DL_CMD=curl -C - -L -o"  >> config.mak
	command -v shasum 2>/dev/null && echo "SHA1_CMD=shasum -a 1 -c" >> config.mak
	for i in x86_64-linux-musl aarch64-linux-musl i686-linux-musl; do
		make -j TARGET=$i OUTPUT=~/.local install
	done
}
