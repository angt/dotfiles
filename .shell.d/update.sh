shell_update() {
	curl -sSf https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.shell.d/git.bash
	curl -sSf https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.shell.d/z.bash
	curl -sSfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	for i in bash yash zsh; do
		curl -sSf https://raw.githubusercontent.com/angt/argz/master/comp/argz.$i > ~/.shell.d/argz.$i
	done
}
