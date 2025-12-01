shell_install_musl() (
	set -e
	rm -rf ~/.tmp/mxm
	mkdir -p ~/.tmp
	git clone gh:angt/musl-cross-make ~/.tmp/mxm
	cd ~/.tmp/mxm
	{	shell_has_cmd curl && echo "DL_CMD=curl -C - -L -o"
		shell_has_cmd shasum && echo "SHA1_CMD=shasum -a 1 -c"
		echo "GCC_VER = 15.1.0"
	} 2>/dev/null >config.mak
	for i in x86_64-linux-musl aarch64-linux-musl
	do
		make -j$(nproc) TARGET=$i OUTPUT=~/.local/usr install
	done
)
