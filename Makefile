install: symlink default

symlink:
	./symlink.sh

default:
	./script/default.sh

java:
	./script/java.sh

scala: java
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
	./theme/install.sh
