.PHONY: all lint format lint-python lint-shell format

all: format lint

lint: pylint shlint

format:
	shfmt -i 4 -w sh/*.sh shrc bashrc bin/vim-configure bin/git-count

pylint:
	black bin/dotfiles
	isort bin/dotfiles
	flake8 bin/dotfiles

shlint:
	shellcheck sh/*.sh shrc bashrc bin/vim-configure bin/git-count
	shfmt -i 4 -d sh/*.sh shrc bashrc bin/vim-configure bin/git-count
