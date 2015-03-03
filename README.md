# My dotfiles

This is very early-experimental stage, so use with much caution.

## Introduction
This is my personal dotfiles using vim and zshell. This aims to set up the same
environment on different computers easily. This contains several dotfiles and
scripts for installation.

## Installation
Run this command:

```
git clone https://github.com/iwataka/dotfiles
```

Then, run this command:

```
./setup.sh
```

This setup script can accept several options like:

+ `--java` : install ant and openjdk-7-jdk
+ `--scala` : install scala and sbt
+ `--ruby` : install gem, bundler, rubocop and rbenv
+ `--python` : install pip, flake8 and pyenv
+ `--nvim` : clone neovim repository and install it
+ `--all` : enable all options above

You want to add options, run the command like this:

```
./setup.sh --scala --ruby --python --nvim
```

## Requirements
After the installation, set zsh as your login shell:

```
chsh -s $(which zsh)
```
