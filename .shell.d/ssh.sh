# shellcheck disable=1090

shell_ssh_agent() {
	test -S "$SSH_AUTH_SOCK" && return
	[ -f ~/.ssh-agent ] && . ~/.ssh-agent
	test -S "$SSH_AUTH_SOCK" && kill -0 "$SSH_AGENT_PID" 2>/dev/null && return
	ssh-agent > ~/.ssh-agent
	chmod 600 ~/.ssh-agent
	. ~/.ssh-agent
}

shell_ssh_host_is_valid() {
	echo "$1" | grep -sq '^[a-zA-Z][a-zA-Z0-9_-]\{1,\}$'
}

shell_ssh_host_exists() {
	shell_ssh_host_is_valid "$1" &&
	grep -sq "^Host $1$" ~/.ssh/config
}

shell_ssh_host_rm() {
	shell_ssh_host_exists "$1" &&
	sed "/^Host $1$/,/^$/d" ~/.ssh/config > ~/.ssh/config.new &&
	mv ~/.ssh/config.new ~/.ssh/config
}

shell_ssh_host_add() {
	shell_ssh_host_is_valid "$1" || return
	shell_ssh_host_exists   "$1" || {
		echo "Host $1"
		shift
		while [ "$#" -ge 2 ]; do
			echo "    $1 $2"
			shift 2
		done
		echo
	} >> ~/.ssh/config
}

mkdir -p ~/.ssh
[ -f ~/.ssh/config ] || :> ~/.ssh/config

shell_ssh_agent
