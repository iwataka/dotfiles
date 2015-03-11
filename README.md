# My dotfiles

This is very early-experimental stage, so use with much caution.

## Introduction
This is my personal dotfiles using vim and zsh. This aims to set up the same
environment on different computers easily.

## Installation
Most quick way is running this command:

```
sh -c "`curl -fsSL https://raw.githubusercontent.com/iwataka/dotfiles/master/install.sh`"
```

You can also install by running this:

```
git clone https://github.com/iwataka/dotfiles ~/dotfiles
cd ~/dotfiles
make install
```

## Requirements
After the installation, set zsh as your login shell:

```
chsh -s $(which zsh)
```
