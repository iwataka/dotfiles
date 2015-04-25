#!/bin/bash

set -e

# this directory
dotfiles_dir=$(cd `dirname $0` && cd .. && pwd)

# removes it if a given path indicates a symbolic link,
# makes backup of it if it exists
remove_or_backup() {
    local path=$1
    if [ -L $path ]; then
        rm $path
    fi
    if [ -e $path ]; then
        mv $path ${path}.backup
    fi
}

link_files=(Xmodmap agignore ctags curlrc gitconfig
            sbtrc spacemacs tmux.conf vim vimperatorrc
            vimrc wgetrc xsession zsh zshenv
            zshrc emacs.d nvimrc)

for file in ${link_files[@]}; do
    remove_or_backup "$HOME/.$file"
    ln -s $dotfiles_dir/$file ~/.$file
done

# symlink for neovim
remove_or_backup ~/.nvim
ln -s $dotfiles_dir/vim ~/.nvim

# make necessary files
if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
    if [ ! -e ~/.cache/shell ]; then
        mkdir -p ~/.cache/shell
    fi
    touch ~/.cache/shell/chpwd-recent-dirs
fi

unset remove_or_backup
