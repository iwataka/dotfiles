install: symlink default

symlink:
	./symlink.sh

default:
	./script/default.sh

ruby:
	./script/ruby.sh

python:
	./script/python.sh

go:
	./script/go.sh

nvim: neovim

neovim:
	./script/neovim.sh

theme:
	./script/theme.sh
