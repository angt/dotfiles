shell_add_path ~/.flutter/bin

flutter_install() {
	rm -rf ~/.flutter
	git clone --depth=1 https://github.com/flutter/flutter ~/.flutter
}
