#!/bin/bash

set -e

dfsdir=$PWD

# Some necessary operations before setup
pre-setup() {
    # Make sure that ~/bin directory exists
    if [ ! -d ~/bin ]; then
        mkdir ~/bin
    fi
}

# Make links of binaries
setup-bins() {
    local bin_directory="$dfsdir/bin"
    for file in $(ls $bin_directory); do
        if [ -e ~/bin/$file ]; then
            rm ~/bin/$file
        fi
        if [[ -f $bin_directory/$file ]]; then
            ln -s $bin_directory/$file ~/bin/$file
        fi
    done
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
        echo "Make ${fpath}.bak"
    fi
}

setup-symlinks() {
    local vim=(vim vimperatorrc vimrc nvimrc ideavimrc)
    local zsh=(zsh zshenv zshrc)
    local emacs=(emacs.d spacemacs)
    local sbt=(sbtrc sbt)
    local others=(agignore ctags curlrc gitconfig tmux.conf \
        wgetrc atom editorconfig tigrc)
    local files=("${vim[@]}" "${zsh[@]}" "${emacs[@]}" "${env[@]}" \
        "${sbt[@]}" "${others[@]}")
    for file in ${files[@]}; do
        remove_or_backup "$HOME/.$file"
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
