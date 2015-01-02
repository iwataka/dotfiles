#! /bin/bash

cd `dirname $0`

# Make directories vim needs
mkdir vim/backups
mkdir vim/swaps
mkdir vim/undo

# Below sentences make symbolic links in home directory.
if [ -L ~/.aliases ]; then
    rm ~/.aliases
fi
ln -s $PWD/aliases ~/.aliases

if [ -L ~/.ctags ]; then
    rm ~/.ctags
fi
ln -s $PWD/ctags ~/.ctags

if [ -L ~/.gitconfig ]; then
    rm ~/.gitconfig
fi
ln -s $PWD/gitconfig ~/.gitconfig

if [ -L ~/.sbt ]; then
    rm ~/.sbt
fi
ln -s $PWD/sbt ~/.sbt

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

if [ -L ~/.vimperatorrc ]; then
    rm ~/.vimperatorrc
fi
ln -s $PWD/vimperatorrc ~/.vimperatorrc

if [ -L ~/.zshenv ]; then
    rm ~/.zshenv
fi
ln -s $PWD/zshenv ~/.zshenv

if [ -L ~/.zshrc ]; then
    rm ~/.zshrc
fi
ln -s $PWD/zshrc ~/.zshrc

if [ -L ~/.zsh_prompt ]; then
    rm ~/.zsh_prompt
fi
ln -s $PWD/zsh_prompt ~/.zsh_prompt
