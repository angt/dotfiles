unset GREP_COLORS

grep --version 2>&1 | grep -sq GNU && {
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
}
