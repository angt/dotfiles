# Make ~/.local/$1 a symlink to $2 (relative to the link's own directory).
#
# ln -sfn replaces a symlink happily, but pointed at a real directory it puts
# the link INSIDE it instead (~/.local/bin/bin -> usr/bin), exits 0, and
# buries whatever was there. So the one rule: nothing but a missing path or an
# old symlink may ever reach ln. A stray directory is removed when empty,
# otherwise reported and left alone.
shell_link_local() (
	link=~/.local/$1

	if [ -e "$link" ] && [ ! -L "$link" ]; then
		rmdir "$link" 2>/dev/null || {
			echo "local.sh: $link is in the way (not a symlink), leaving it alone" >&2
			return 1
		}
	fi

	[ "$(readlink "$link")" = "$2" ] || ln -sfn "$2" "$link"
)

mkdir -p \
	~/.local/usr/bin \
	~/.local/usr/share/man \
	~/.local/usr/lib/pkgconfig \
	~/.local/usr/include

shell_link_local usr/sbin bin
shell_link_local usr/man  share/man

shell_link_local bin     usr/bin
shell_link_local sbin    usr/sbin
shell_link_local man     usr/man
shell_link_local share   usr/share
shell_link_local lib     usr/lib
shell_link_local include usr/include

shell_add_path ~/.local/bin
shell_add_manpath ~/.local/man
shell_add_lib_path ~/.local/lib

shell_setup_local_dev() {
	export PKG_CONFIG_PATH=~/.local/lib/pkgconfig
	export LIBRARY_PATH=~/.local/lib
	export CPATH=~/.local/include
}

shell_cleanup_local_dev() {
	unset PKG_CONFIG_PATH LIBRARY_PATH CPATH
}

shell_setup_local_dev
