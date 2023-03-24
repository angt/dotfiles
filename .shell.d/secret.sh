shell_install_secret() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf secret
	git clone https://github.com/angt/secret --recursive
	EXTRA=
	case "$(uname -s)" in
		Darwin) ;;
		*) EXTRA=-static
	esac
	make -C secret EXTRA=$EXTRA DESTDIR=~/.local prefix=/usr install
)
