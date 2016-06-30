#!/bin/bash

set -e

dfsdir=$PWD

# Some necessary operations before setup
pre-setup() {
    # Make sure that ~/bin and ~/.config directory exists
    if [ ! -d ~/bin ]; then
        mkdir ~/bin
    fi
    if [ ! -d ~/.config ]; then
        mkdir ~/.config
    fi
}

# Removes it if a given path indicates a symbolic link and
# makes a backup if it exists
remove_or_backup() {
    local fpath=$1
    if [ -L $fpath ]; then
        rm $fpath
    fi
    if [ -e $fpath ]; then
        mv $fpath ${fpath}.bak
        echo "Make backup file: ${fpath}.bak"
    fi
}

# Make links of binaries
setup-bins() {
    local bin_directory="$dfsdir/bin"
    for file in $(ls $bin_directory); do
        remove_or_backup ~/bin/$file
        if [[ -f $bin_directory/$file ]]; then
            ln -s $bin_directory/$file ~/bin/$file
        fi
    done
}

setup-symlinks() {
    local files=(vim vimperatorrc vimrc ideavimrc \
        zsh zshenv zshrc sh shrc bashrc emacs.d spacemacs sbtrc sbt \
        agignore ctags curlrc gitconfig git_template tmux.conf \
        wgetrc atom editorconfig tigrc gnupg ssh peco Xresources)
    for file in ${files[@]}; do
        remove_or_backup $HOME/.$file
        ln -s $dfsdir/$file ~/.$file
    done
    # symlink for neovim
    remove_or_backup ~/.config/nvim
    ln -s $dfsdir/vim ~/.config/nvim
}

if [[ ! -d $dfsdir ]]; then
    git clone https://github.com/iwataka/dotfiles $dfsdir
    cd $dfsdir
fi
pre-setup
setup-bins
setup-symlinks
