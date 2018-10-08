shell_add_path ~/.flutter.d/bin

shell_install_flutter() {
	rm -rf ~/.flutter.d
	git clone --depth=1 https://github.com/flutter/flutter ~/.flutter.d
}
