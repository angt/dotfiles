command -v ruby >/dev/null &&
shell_add_path "$(ruby -e 'print Gem.user_dir')/bin"
