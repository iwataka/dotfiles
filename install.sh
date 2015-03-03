#! /bin/bash

# dotfiles path
dotfiles=$HOME/dotfiles

if [ ! -d $dotfiles ]; then
    git clone https://github.com/iwataka/dotfiles $dotfiles
    cd $dotfiles
    # make symbolic links, necessary files and so on
    script/setup.sh
    # package manager depends on OS type
    if [ $OSTYPE == 'linux-gnu' ]; then
        script/apt-get.sh "$@"
    fi
else
    echo "The dotfiles directory already exists."
fi
