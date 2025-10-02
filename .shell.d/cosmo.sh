shell_setup_cosmo() {
	shell_add_path ~/.cosmo/bin
}

__shell_install_cosmo() (
	rm -rf ~/.cosmo
	mkdir -p ~/.cosmo
	cd ~/.cosmo || return
	curl -O https://cosmo.zip/pub/cosmocc/cosmocc.zip
	unzip cosmocc.zip
)

shell_install_cosmo() {
	__shell_install_cosmo && shell_setup_cosmo
}

[ -d ~/.cosmo/bin ] && shell_setup_cosmo
