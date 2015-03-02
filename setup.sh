#! /bin/bash

set -e

cd `dirname $0`

# Make directories vim needs
dirs="vim/backups vim/swaps vim/undo"
for dir in $dirs; do
    if [ ! -e $PWD/$dir ]; then
        mkdir $dir
    fi
done

# Make symbolic links to these files.
shell="aliases functions zshenv zshrc zsh_prompt"
vim="vim vimrc vimrc.bundles vimperatorrc"
scala="sbt sbtrc"
misc="agignore ctags gitconfig spacemacs tmux.conf"

for file in $shell $vim $scala $misc; do
    if [ -L ~/.$file ]; then
        rm ~/.$file
    fi
    ln -s $PWD/$file ~/.$file
done

# neovim
if [ -L ~/.nvim ]; then
    rm ~/.nvim
fi
ln -s $PWD/vim ~/.nvim

if [ -L ~/.nvimrc ]; then
    rm ~/.nvimrc
fi
ln -s $PWD/vimrc ~/.nvimrc

sudo -v

apt-get install git
apt-get install openjdk-7-jdk
