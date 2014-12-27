#! /bin/bash

cd `dirname $0`

if [ -L ~/.aliases ]; then
    rm ~/.aliases
fi
ln -s $PWD/aliases ~/.aliases

if [ -L ~/.bash_profile ]; then
    rm ~/.bash_profile
fi
ln -s $PWD/bash_profile ~/.bash_profile

if [ -L ~/.bashrc ]; then
    rm ~/.bashrc
fi
ln -s $PWD/bashrc ~/.bashrc

if [ -L ~/.ctags ]; then
    rm ~/.ctags
fi
ln -s $PWD/ctags ~/.ctags

if [ -L ~/.gitconfig ]; then
    rm ~/.gitconfig
fi
ln -s $PWD/gitconfig ~/.gitconfig

if [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
ln -s $PWD/tmux.conf ~/.tmux.conf

if [ -L ~/.vim ]; then
    rm ~/.vim
fi
ln -s $PWD/vim ~/.vim

if [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s $PWD/vimrc ~/.vimrc

if [ -L ~/.nvimrc ]; then
    rm ~/.nvimrc
fi
ln -s $PWD/vimrc ~/.nvimrc

if [ -L ~/.vimrc.bundles ]; then
    rm ~/.vimrc.bundles
fi
ln -s $PWD/vimrc.bundles ~/.vimrc.bundles

if [ -L ~/.zshrc ]; then
    rm ~/.zshrc
fi
ln -s $PWD/zshrc ~/.zshrc
