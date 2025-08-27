shell_install_llvm() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf llvm-project
	git clone --depth 1 https://github.com/llvm/llvm-project ||:
	cd llvm-project
	mkdir -p build
	cd build
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	case "$OS" in
	(darwin) LLVM_ENABLE_LLD=OFF ;;
	(*)      LLVM_ENABLE_LLD=ON  ;;
	esac
	cmake -G Ninja ../llvm \
		-DCMAKE_BUILD_TYPE=Release \
		-DLLVM_ENABLE_LLD="$LLVM_ENABLE_LLD" \
		-DLLVM_ENABLE_PROJECTS="clang;mlir" \
		-DLLVM_TARGETS_TO_BUILD="AArch64;X86" \
		-DMLIR_ENABLE_BINDINGS_PYTHON=ON \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local/usr"
	ninja install
)
