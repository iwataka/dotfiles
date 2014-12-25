#! /bin/bash

if [ -L ~/.bash_profile ]; then
    rm ~/.bash_profile
fi

if [ -L ~/.bashrc ]; then
    rm ~/.bashrc
fi

if [ -L ~/.gitconfig ]; then
    rm ~/.gitconfig
fi

if [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi

if [ -L ~/.vim ]; then
    rm ~/.vim
fi

if [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi

if [ -L ~/.zshrc ]; then
    rm ~/.zshrc
fi
