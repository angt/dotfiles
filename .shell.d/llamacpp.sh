shell_install_llamacpp() (
	curl angt.github.io/installama.sh | sh
)

# shellcheck disable=2088
shell_setup_llamacpp() {
	tmux new-session -d -s llamacpp &&
	tmux send-keys -t llamacpp '~/.installama/llama-server --fim-qwen-14b-spec' C-m
}
