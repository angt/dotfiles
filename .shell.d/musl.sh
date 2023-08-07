shell_install_musl() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf musl-cross-make
	git clone https://github.com/richfelker/musl-cross-make
	cd musl-cross-make
	{	command -v curl   >&2 && echo "DL_CMD=curl -C - -L -o"
		command -v shasum >&2 && echo "SHA1_CMD=shasum -a 1 -c"
		echo "GCC_VER =  11.2.0"
	} 2>/dev/null >config.mak
	for i in {x86_64,i686}-linux-musl     \
		     aarch64{,_be}-linux-musl     \
		     arm{,eb}-linux-musleabi{,hf} \
		     riscv64-linux-musl           \
		     mips64{,el}-linux-musl{,n32}{,sf}
		do make -j TARGET=$i OUTPUT=~/.local/usr install
	done
)
