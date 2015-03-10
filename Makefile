all: symlink default java scala ruby python go nvim

install: symlink default

symlink:
	./symlink.sh

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
