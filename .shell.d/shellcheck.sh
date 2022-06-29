shell_install_shellcheck() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	V="v0.8.0"
	OS="$(uname | tr '[:upper:]' '[:lower:]')"
	URL="https://github.com/koalaman/shellcheck/releases/download/$V/shellcheck-$V.$OS.x86_64.tar.xz"
	case "$(uname -m)" in
	(x86_64) ;;
	(*) echo "Arch not supported"; exit 1;;
	esac
	curl -sSf "$URL" | tar -xJf -
	mv -f "shellcheck-$V/shellcheck" "$HOME/.local/bin"
)
