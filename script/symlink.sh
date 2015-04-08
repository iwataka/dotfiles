#!/bin/bash

# this directory
dotfiles_dir=$(cd `dirname $0` && cd .. && pwd)
# source common settings
source "$dotfiles_dir/script/commons.sh"

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

excluded_files="spacemacs"

link_files=(Xmodmap agignore ctags curlrc gitconfig
            sbtrc spacemacs tmux.conf vim vimperatorrc
            vimrc wgetrc xsession zsh zshenv
            zshrc)

# make symbolic links of files in link directory
link_path="$dotfiles_dir/link"
for file in ${link_files[@]}; do
    if [[ ! $file =~ $excluded_files ]]; then
        remove_or_backup "$HOME/.$file"
        ln -s $link_path/$file ~/.$file
    fi
done

# symlink for neovim
remove_or_backup ~/.nvimrc
ln -s $link_path/vimrc ~/.nvimrc
remove_or_backup ~/.nvim
ln -s $link_path/vim ~/.nvim

# make necessary files
if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
    if [ ! -e ~/.cache/shell ]; then
        mkdir -p ~/.cache/shell
    fi
    touch ~/.cache/shell/chpwd-recent-dirs
fi

unset remove_or_backup
