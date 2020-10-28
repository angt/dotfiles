export HOMEBREW_PREFIX="$HOME/.brew"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"

shell_add_path "$HOMEBREW_PREFIX/bin"
shell_add_path "$HOMEBREW_PREFIX/sbin"
shell_add_manpath "$HOMEBREW_PREFIX/share/man"

shell_install_brew() {
	set -e
	rm -rf ~/.brew
	git clone https://github.com/Homebrew/brew ~/.brew
}
