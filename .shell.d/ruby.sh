shell_has_cmd ruby &&
shell_add_path "$(ruby -e 'print Gem.user_dir')/bin"
