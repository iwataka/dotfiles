.PHONY: all lint format lint-python lint-shell format

all: format lint

lint: pylint shlint

pylint:
	black install.py
	isort install.py
	flake8 install.py

shlint:
	shellcheck sh/*.sh shrc bashrc bin/vim-configure bin/git-count

format:
	shfmt -i 4 -w sh/*.sh shrc bashrc bin/vim-configure bin/git-count
