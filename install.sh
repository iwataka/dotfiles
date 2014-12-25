#! /bin/bash

THIS_SCRIPT=`realpath $0`
DOT_FILES=`dirname $THIS_SCRIPT`

if [ -L ~/.bash_profile ]; then
    rm ~/.bash_profile
fi
ln -s $DOT_FILES/bash_profile ~/.bash_profile

if [ -L ~/.bashrc ]; then
    rm ~/.bashrc
fi
ln -s $DOT_FILES/bashrc ~/.bashrc

if [ -L ~/.gitconfig ]; then
    rm ~/.gitconfig
fi
ln -s $DOT_FILES/gitconfig ~/.gitconfig

if [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
ln -s $DOT_FILES/tmux.conf ~/.tmux.conf

if [ -L ~/.vim ]; then
    rm ~/.vim
fi
ln -s $DOT_FILES/vim ~/.vim

if [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s $DOT_FILES/vimrc ~/.vimrc

if [ -L ~/.zshrc ]; then
    rm ~/.zshrc
fi
ln -s $DOT_FILES/zshrc ~/.zshrc
