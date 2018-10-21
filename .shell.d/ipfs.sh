source ~/.shell.d/go.sh

shell_install_ipfs() {
	go get -u github.com/ipfs/ipfs-update
	ipfs-update install latest
}
