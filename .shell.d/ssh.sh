find ~/.ssh -exec grep -sq 'PRIVATE KEY' {} \; -and -exec chmod 400 {} \;

{ . ~/.ssh-agent
	if ! kill -0 "$SSH_AGENT_PID"; then
		ssh-agent >~/.ssh-agent
		. ~/.ssh-agent
	fi
} 2>/dev/null
