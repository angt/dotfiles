shell_install_secret() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf secret
	git clone https://github.com/angt/secret -b totp --recursive
	CFLAGS="-Wall -O2 -march=native"
	case "$(uname -s)" in
		Darwin) ;;
		*) CFLAGS="$CFLAGS -static"
	esac
	make -C secret CFLAGS="$CFLAGS" DESTDIR=~/.local prefix=/usr install
)
