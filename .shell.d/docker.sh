alias dc=docker-compose
alias dm=docker-machine
alias k=kubectl

dmset() {
	eval "$(docker-machine env ${1---unset})"
}
