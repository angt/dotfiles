shell_install_ninja() (
	case "$(uname -s)" in
	(Linux) ninja=linux ;;
	(Darwn) ninja=mac   ;;
	(*)     false       ;;
	esac &&
	curl -L "https://github.com/ninja-build/ninja/releases/latest/download/ninja-$ninja.zip" -o ninja.zip &&
	unzip ninja.zip -d "$HOME/.local/bin" &&
	rm ninja.zip
)
