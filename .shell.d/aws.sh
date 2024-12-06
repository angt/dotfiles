shell_install_aws() (
	set -e
	mkdir -p ~/.tmp
	cd ~/.tmp
	rm -rf aws-cli
	git clone --depth 1 https://github.com/aws/aws-cli -b v2
	cd aws-cli
	uv pip install -r requirements-dev.txt
	uv pip install -e .
)
