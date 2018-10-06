shell_add_path ~/.flutter/bin

shell_install_flutter() {
	rm -rf ~/.flutter
	git clone --depth=1 https://github.com/flutter/flutter ~/.flutter
}
