if command -v xclip >/dev/null; then
	alias xcopy='xclip -selection clipboard -i'
	alias xpaste='xclip -selection clipboard -o'
elif command -v pbcopy >/dev/null; then
	alias xcopy='pbcopy'
	alias xpaste='pbpaste'
fi

xcopysecret() {
	(sleep 10; xcopy </dev/null) >/dev/null 2>&1 & xcopy
}
