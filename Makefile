install: symlink binary default

symlink:
	./script/symlink.sh

binary:
	./script/binary.sh

default:
	./script/default.sh

java:
	./script/java.sh

scala:
	./script/scala.sh

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
