export TERMINFO=~/.terminfo

shell_update_terminfo() {
	for i in ~/.terminfo.d/*; do
		[ "$i" ] && tic -x "$i"
	done
}

[ -e ~/.terminfo ] || shell_update_terminfo
