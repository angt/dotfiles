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

shell_clone_tmp() {
	[ "$1" ]             &&
	rm -rf ~/.tmp/"$1"   &&
	mkdir -p ~/.tmp/"$1" &&
	cd ~/.tmp/"$1"       &&
	shift                &&
	git clone \
		--filter=blob:none \
		--recurse-submodules \
		--also-filter-submodules \
		"$@" .
}
