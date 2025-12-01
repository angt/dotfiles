if ! shell_has_cmd setenv; then
	setenv() {
		if [ $# -eq 0 ]
		then env
		else export "$1=$2"
		fi
	}
	unsetenv() {
		unset "$1"
	}
fi
