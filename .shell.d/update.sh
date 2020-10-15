shell_update() {
	curl -sSf https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.shell.d/git.bash
	curl -sSf https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.shell.d/z.bash
	curl -sSfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -sSf https://raw.githubusercontent.com/richfelker/install.sh/master/install.sh > ~/.bin/install
	curl -sSf https://raw.githubusercontent.com/angt/argz/master/comp/argz.bash > ~/.shell.d/argz.bash
	curl -sSf https://raw.githubusercontent.com/angt/argz/master/comp/argz.yash > ~/.shell.d/argz.yash
	chmod +x ~/.bin/install
}
