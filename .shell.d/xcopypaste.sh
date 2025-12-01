if shell_has_cmd xclip; then
	alias xcopy='xclip -selection clipboard -i'
	alias xpaste='xclip -selection clipboard -o'
elif shell_has_cmd pbcopy; then
	alias xcopy='pbcopy'
	alias xpaste='pbpaste'
fi

xcopysecret() {
	(sleep 10; xcopy </dev/null) >/dev/null 2>&1 & xcopy
}
