#!/bin/bash

dotfiles_path="$HOME/dotfiles"

if [ -d ~/dotfiles ]; then
    echo "already installed."
else
    git clone https://github.com/iwataka/dotfiles $dotfiles_path
    cd $dotfiles_path
    make install
fi
