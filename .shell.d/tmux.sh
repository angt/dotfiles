tm() {
    tmux attach -t $1 || tmux new-session -s $1
}
