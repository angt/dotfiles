find ~/.ssh -exec grep -sq 'PRIVATE KEY' {} \; -and -exec chmod 400 {} \;

ssh-agent >~/.ssh-agent 2>/dev/null
[ "$SSH_AGENT_PID" ] || . ~/.ssh-agent
