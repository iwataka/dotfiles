#! /bin/bash

if [ -d ~/dotfiles ]; then
    echo "already installed."
else
    git clone https://github.com/iwataka/dotfiles ~/dotfiles
    cd ~/dotfiles
    make install
fi
