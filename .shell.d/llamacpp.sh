shell_install_llamacpp() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf llama.cpp
	git clone --depth 1 https://github.com/ggml-org/llama.cpp
	cd llama.cpp
	cmake -B build \
		-DLLAMA_CURL=ON \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local" \
		-DCMAKE_INSTALL_LIBDIR="$HOME/.local/lib"
	cmake --build build --config Release -j
	cmake --install build
)

shell_setup_llamacpp() {
	tmux new-session -d -s llamacpp &&
	tmux send-keys -t llamacpp 'llama-server --fim-qwen-14b-spec' C-m
}
