install: links bins default

links:
	./script/setup-links.sh

bins:
	./script/setup-bins.sh

default-packages:
	./script/install-packages.sh default-packages

java:
	./script/install-packages.sh java

scala: java
	./script/install-packages.sh scala

ruby:
	./script/install-packages.sh ruby

python:
	./script/install-packages.sh python

go:
	./script/install-packages.sh go

nvim: neovim

neovim:
	./script/install-packages.sh neovim

theme:
	./script/install-packages.sh theme

font:
	./script/install-packages.sh font
