shell_install_shellcheck() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	V="v0.8.0"
	OS="$(uname | tr '[:upper:]' '[:lower:]')"
	case "$(uname -m)" in
	(x86_64) ;;
	(*) echo "Arch not supported"; exit 1;;
	esac
	curl -sSf "https://github.com/koalaman/shellcheck/releases/download/$V/shellcheck-$V.$OS.x86_64.tar.xz" \
		| xz -d | tar -xf -
	mv -f "shellcheck-$V/shellcheck" "$HOME/.local/bin"
)
