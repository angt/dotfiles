[ -x "$(command -v ruby)" ] && shell_add_path "$(ruby -e 'print Gem.user_dir')/bin"
