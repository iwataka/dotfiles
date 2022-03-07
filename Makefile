.PHONY: all lint format lint-python lint-shell format

all: format lint

lint: pylint shlint

pylint:
	black bin/dotfiles
	isort bin/dotfiles
	flake8 bin/dotfiles

shlint:
	shellcheck sh/*.sh shrc bashrc bin/vim-configure bin/git-count

format:
	shfmt -i 4 -w sh/*.sh shrc bashrc bin/vim-configure bin/git-count
