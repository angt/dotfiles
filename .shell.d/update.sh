shell_update_all() {
	shell_update_git
	shell_update_z
}

shell_update_git() {
	curl -sSf https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.shell.d/git.sh
}

shell_update_z() {
	curl -sSf https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.shell.d/z.sh
}
