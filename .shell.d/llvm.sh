shell_install_llvm() (
	set -e
	rm -rf ~/.tmp/llvm
	mkdir -p ~/.tmp
	git clone https://github.com/llvm/llvm-project ~/.tmp/llvm
	cd ~/.tmp/llvm
	[ "$1" ] && git checkout "$1"
	cmake -S llvm -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DLLVM_ENABLE_PROJECTS="clang;mlir" \
		-DLLVM_TARGETS_TO_BUILD="AArch64;X86" \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local/usr"
	cmake --build build --target install
)
