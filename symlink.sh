#!/bin/bash

# this script directory
script_dir=$(cd `dirname $0` && pwd)

# removes it if a given path indicates a symbolic link,
# makes backup of it if it exists
remove_or_backup() {
    local path=$1
    if [ -L $path ]; then
        rm -f $path
    fi
    if [ -e $path ]; then
        mv $path ${path}.backup
    fi
}

# make symbolic links of files in link directory
link_path="$script_dir/link"
for file in $(ls $link_path); do
    remove_or_backup "$HOME/.$file"
    ln -s $link_path/$file ~/.$file
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

# make binaries executable
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
for file in $(ls ${script_dir}/bin); do
    if [ -e ~/bin/$file ]; then
        rm ~/bin/$file
    fi
    cp $script_dir/bin/$file ~/bin/$file
    chmod u+x ~/bin/$file
done

unset remove_or_backup
