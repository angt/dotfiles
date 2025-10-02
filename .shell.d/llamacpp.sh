shell_install_llamacpp() (
	set -e
	rm -rf ~/.tmp/llama.cpp
	mkdir -p ~/.tmp
	git clone --depth 1 https://github.com/ggml-org/llama.cpp ~/.tmp/llama.cpp
	cd ~/.tmp/llama.cpp
	cmake -B build \
		-DLLAMA_CURL=OFF \
		-DLLAMA_OPENSSL=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local"
	cmake --build build -j"$(nproc)" --target install
)

shell_setup_llamacpp() {
	tmux new-session -d -s llamacpp &&
	tmux send-keys -t llamacpp 'llama-server --fim-qwen-14b-spec' C-m
}
