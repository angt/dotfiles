shell_install_musl() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf musl-cross-make
	git clone gh:angt/musl-cross-make
	cd musl-cross-make
	{	command -v curl   >&2 && echo "DL_CMD=curl -C - -L -o"
		command -v shasum >&2 && echo "SHA1_CMD=shasum -a 1 -c"
		echo "GCC_VER = 15.1.0"
	} 2>/dev/null >config.mak
	for i in x86_64-linux-musl aarch64-linux-musl
	do
		make -j$(nproc) TARGET=$i OUTPUT=~/.local/usr install
	done
)
