find ~/.ssh -exec grep -sq 'PRIVATE KEY' {} \; -and -exec chmod 400 {} \;

shell_ssh_agent() {
	. ~/.ssh-agent

	test -S "$SSH_AUTH_SOCK" && kill -0 "$SSH_AGENT_PID" && return

	ssh-agent >~/.ssh-agent
	. ~/.ssh-agent
}

shell_ssh_agent >/dev/null 2>/dev/null

[ -f ~/.ssh/authorized_keys ] || cp ~/.ssh/id_ed25519.pub  ~/.ssh/authorized_keys
