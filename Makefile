all: format lint

lint: lint-python lint-shell

lint-python:
	black setup.py
	isort setup.py
	flake8 setup.py

lint-shell:
	shellcheck sh/*.sh shrc bashrc bin/vim-configure bin/git-count

format:
	shfmt -i 4 -w sh/*.sh shrc bashrc bin/vim-configure bin/git-count
