# shellcheck disable=1090

shell_ssh_agent() {
	test -S "$SSH_AUTH_SOCK" && return
	[ -f ~/.ssh/agent ] && . ~/.ssh/agent
	test -S "$SSH_AUTH_SOCK" && kill -0 "$SSH_AGENT_PID" 2>/dev/null && return
	ssh-agent > ~/.ssh/agent
	chmod 600 ~/.ssh/agent
	. ~/.ssh/agent
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

shell_ssh_host_addr() {
	ssh -G "$@" 2>/dev/null | sed -n 's/^hostname //p'
}

shell_ssh_pubkey() {
	if [ "$1" ]
	then ssh-add -L | grep -s -- "$1"
	else ssh-add -L
	fi
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

shell_ssh_hosts() {
	sed -nE 's/^Host[[:space:]]+//p' ~/.ssh/config | sort -u
}

mkdir -p ~/.ssh
chmod 700 ~/.ssh

[ -f ~/.ssh/config          ] || touch ~/.ssh/config
[ -f ~/.ssh/authorized_keys ] ||
	echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArbSYP0EYqQQnBuIoTGvNUcOA5TJGdsDUMLg/OSt2zv angt" > ~/.ssh/authorized_keys

chmod 600 ~/.ssh/config ~/.ssh/authorized_keys

shell_ssh_agent
