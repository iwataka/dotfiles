# My dotfiles

## Introduction
This is my dotfiles using vim and zshell. This aims to set up the same
environment on different computers easily. This contains several dotfiles and
setup script for making symbolic links and package installation.

## Installation
First, clone this repository:

```
git clone https://github.com/iwataka/dotfiles
```

Then, run this command:

```
./setup.sh
```

This setup script can accept several options like:

+ `--java` : enable to install packages about java.
+ `--scala` : enable to install packages about scala.
+ `--ruby` : enable to install packages about ruby (gem command is required).
+ `--python` : enable to install packages about python (pip command is required).

You want to add options, run the command like this:

```
./setup.sh --java --scala --ruby --python
```

## Requirements
After the installation, set zsh as your login shell:

```
chsh -s $(which zsh)
```

## References

+ [RubyGem](https://rubygems.org/pages/download)
