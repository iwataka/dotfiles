all: lint format

lint:
	shellcheck *.sh sh/*.sh shrc bashrc

format:
	shfmt -i 4 -w *.sh sh/*.sh shrc bashrc
