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
	tmux new-session -d -s llamacpp &&
	tmux send-keys -t llamacpp llamacpp C-m
}
