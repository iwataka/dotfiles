#!/bin/bash

# this script directory
script_dir=$(cd `dirname $0` && pwd)

# target directories
target_dirs=(git zsh)

# target files in root directory
target_files=(agignore ctags curlrc sbtrc spacemacs tmux.conf vimperatorrc wgetrc)

remove_or_backup() {
    local path=$1
    if [ -L $path ]; then
        rm -f $path
    fi
    if [ -e $path ]; then
        mv $path ${path}.backup
    fi
}

for dir in ${target_dirs[@]}; do
    path=$script_dir/$dir
    files=($(ls $path))
    for file in ${files[@]}; do
        remove_or_backup "$HOME/.$file"
        ln -s $path/$file ~/.$file
    done
done

remove_or_backup ~/.nvimrc
ln -s $script_dir/vimrc ~/.nvimrc
remove_or_backup ~/.vim
ln -s $script_dir/vim ~/.vim
remove_or_backup ~/.nvim
ln -s $script_dir/vim ~/.nvim

for file in ${target_files[@]}; do
    remove_or_backup "$HOME/.$file"
    ln -s $script_dir/$file ~/.$file
done

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
