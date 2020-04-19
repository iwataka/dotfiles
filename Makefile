all: lint format

lint:
	shellcheck *.sh sh/*.sh shrc bashrc bin/vim-configure bin/git-count

format:
	shfmt -i 4 -w *.sh sh/*.sh shrc bashrc bin/vim-configure bin/git-count
