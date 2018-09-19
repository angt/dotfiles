alias dm=docker-machine

dmset() {
	eval "$(docker-machine env ${1---unset})"
}
