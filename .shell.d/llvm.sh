shell_install_llvm() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf llvm-project
	git clone https://github.com/llvm/llvm-project
	cd llvm-project
	[ "$1" ] && git checkout "$1"
	mkdir -p build
	cd build
	cmake -G Ninja ../llvm \
		-DCMAKE_BUILD_TYPE=Release \
		-DLLVM_ENABLE_PROJECTS="clang;mlir" \
		-DLLVM_TARGETS_TO_BUILD="AArch64;X86" \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local/usr"
	ninja install
)
