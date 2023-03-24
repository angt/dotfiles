find ~/.ssh -exec grep -sq 'PRIVATE KEY' {} \; -and -exec chmod 400 {} \;

{ . ~/.ssh-agent
	if ! kill -0 "$SSH_AGENT_PID"; then
		ssh-agent >~/.ssh-agent
		. ~/.ssh-agent
	fi
} >/dev/null 2>/dev/null

[ -f ~/.ssh/authorized_keys ] || cp ~/.ssh/id_ed25519.pub  ~/.ssh/authorized_keys
