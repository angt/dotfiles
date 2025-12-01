export TERMINFO=~/.terminfo

shell_update_terminfo() {
	for i in ~/.terminfo.d/*; do
		[ "$i" ] && tic -x "$i" || :
	done
}

shell_save_terminfo() {
	infocmp -x "$TERM" | grep -sv '^#' > ~/.terminfo.d/"$TERM"
}

[ -e ~/.terminfo ] || shell_update_terminfo
