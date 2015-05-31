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
    local vim=(vim vimperatorrc vimrc nvimrc)
    local zsh=(zsh zshenv zshrc)
    local emacs=(emacs.d spacemacs)
    local env=(Xmodemap xsession)
    local others=(agignore ctags curlrc gitconfig sbtrc tmux.conf wgetrc atom)
    local files=("{vim[@]}" "{zsh[@]}" "{emacs[@]}" "{env[@]}" "{others[@]}")
    for file in ${files[@]}; do
        remove_or_backup "$HOME/.$file"
        ln -s $dfsdir/$file ~/.$file
    done
    # symlink for neovim
    remove_or_backup ~/.nvim
    ln -s $dfsdir/vim ~/.nvim
}

if [[ ! -d $dfsdir ]]; then
    git clone https://github.com/iwataka/dotfiles $dfsdir
    cd $dfsdir
fi
pre-setup
setup-bins
setup-symlinks
