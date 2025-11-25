if ! command -v setenv >/dev/null; then
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
