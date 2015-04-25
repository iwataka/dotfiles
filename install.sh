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
    git clone https://github.com/paulirish/git-open $path
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
        ln -s $dotfiles_dir/$file ~/.$file
    done
    # symlink for neovim
    remove_or_backup ~/.nvim
    ln -s $dotfiles_dir/vim ~/.nvim
}

if [[ ! -d $dfsdir ]]
    git clone https://github.com/iwataka/dotfiles $dfsdir
    cd $dfsdir
fi
pre-setup
setup-bins
install-git-open
setup-symlink
