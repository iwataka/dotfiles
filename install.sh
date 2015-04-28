#!/bin/bash

set -e

dfsdir="$HOME/dotfiles"

# Some necessary operations before setup
pre-setup() {
    # Make sure that ~/bin directory exists
    if [ ! -d ~/bin ]; then
        mkdir ~/bin
    fi
    # Make sure that chpwd-recent-dirs file exists
    if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
        if [ ! -e ~/.cache/shell ]; then
            mkdir -p ~/.cache/shell
        fi
        touch ~/.cache/shell/chpwd-recent-dirs
    fi
}

# Copy binaries and make them executable
setup-bins() {
    local path="$dfsdir/bin"
    for file in $(ls $path); do
        if [ -e ~/bin/$file ]; then
            rm ~/bin/$file
        fi
        if [[ -f $path/$file ]]; then
            cp $path/$file ~/bin/$file
            chmod u+x ~/bin/$file
        fi
    done
}

# TODO: move this to the package manager
install-git-open() {
    local path=$HOME/projects/git-open
    if [[ ! -d $path ]]; then
        git clone https://github.com/paulirish/git-open $path
    else
        cd $path
        git pull
    fi
    # Remove old git-open if exists
    if [ -e ~/bin/git-open ]; then
        rm ~/bin/git-open
    fi
    # Copy git-open file and make it executable.
    cp $path/git-open ~/bin/git-open
    chmod u+x ~/bin/git-open
}

# Removes it if a given path indicates a symbolic link and
# makes a backup if it exists
remove_or_backup() {
    local path=$1
    if [ -L $path ]; then
        rm $path
    fi
    if [ -e $path ]; then
        mv $path ${path}.backup
    fi
}

setup-symlinks() {
    files=(Xmodmap agignore ctags curlrc gitconfig
           sbtrc spacemacs tmux.conf vim vimperatorrc
           vimrc wgetrc xsession zsh zshenv
           zshrc emacs.d nvimrc)
    for file in ${files[@]}; do
        remove_or_backup "$HOME/.$file"
        ln -s $dfsdir/$file ~/.$file
    done
    # symlink for neovim
    remove_or_backup ~/.nvim
    ln -s $dfsdir/vim ~/.nvim
}

install-packages() {
    if [ $OSTYPE == "linux-gnu" ]; then
        sudo apt-get update && sudo apt-get upgrade
        # necessaary to clone various projects
        sudo apt-get install git
        # mainly clone openjdk
        sudo apt-get install mercurial
        # default shell
        sudo apt-get install zsh
        # default editor
        sudo apt-get install vim
        # cooperate with vim
        sudo apt-get install tmux
        # tagbar and so on
        sudo apt-get install exuberant-ctags
        # faster code-searching tool
        sudo apt-get install silversearcher-ag
        # displays directory structure as a tree
        sudo apt-get install tree
        # tweak images
        sudo apt-get install imagemagick
        # code formatter for java, c and cpp
        sudo apt-get install astyle
        # youcompleteme
        sudo apt-get install build-essential cmake python-dev
    fi
}

if [[ $# == 0 ]]; then
    if [[ ! -d $dfsdir ]]; then
        git clone https://github.com/iwataka/dotfiles $dfsdir
        cd $dfsdir
    fi
    pre-setup
    setup-bins
    install-git-open
    setup-symlinks
    install-packages
else
    for name in $@; do
        $name
    done
fi
