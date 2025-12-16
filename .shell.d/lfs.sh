shell_install_lfs() (
	[ "$1" ] || set -- "v3.7.1"
	URL="https://github.com/git-lfs/git-lfs/releases/download"
	OS=$(uname -s | tr '[:upper:]' '[:lower:]')
	ARCH=$(uname -m)
	case "$ARCH" in
	(x86_64)  ARCH=amd64 ;;
	(aarch64) ARCH=arm64 ;;
	esac
	case "$OS" in
	(darwin) EXT=zip Z= ;;
	(*)      EXT=tar.gz Z=z;;
	esac
	mkdir -p ~/.local/bin
	cd ~/.local/bin &&
	curl -sSfL "$URL/$1/git-lfs-$OS-$ARCH-$1.$EXT" |
		tar -xO$Z -f - "git-lfs-${1#v}/git-lfs" > git-lfs &&
	chmod +x git-lfs
)
