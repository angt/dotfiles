shell_install_llamacpp() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf llama.cpp
	git clone --depth 1 https://github.com/ggerganov/llama.cpp
	cd llama.cpp
	cmake -B build \
		-DCMAKE_INSTALL_PREFIX="$HOME/.local" \
		-DCMAKE_INSTALL_LIBDIR="$HOME/.local/lib"
	cmake --build build --config Release -j
	cmake --install build
)

shell_setup_llamacpp() {
	[ -e ~/.model.gguf ] ||
		curl -sSf 'https://hf.co/ggml-org/Qwen2.5-Coder-7B-Q8_0-GGUF/resolve/main/qwen2.5-coder-7b-q8_0.gguf?download=true' \
			-o ~/.model.gguf
	llama-server \
		-m ~/.model.gguf \
		--port 8012 -fa -ub 1024 -b 1024 \
		--ctx-size 0 --cache-reuse 256
}
