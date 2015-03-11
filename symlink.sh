#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/script/commons.sh"

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

# make binary directory for user
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

# copy binaries and make them executable
bin_path="$script_dir/bin"
for file in $(ls $bin_path); do
    if [ -e ~/bin/$file ]; then
        rm ~/bin/$file
    fi
    if [[ -f $bin_path/$file ]]; then
        cp $bin_path/$file ~/bin/$file
        chmod u+x ~/bin/$file
    fi
done

# url and path for git-open
gitopen_url="https://github.com/paulirish/git-open"
gitopen_path="$project_dir/git-open"
git_clone_or_pull $gitopen_url $gitopen_path
# remove old git-open if exists
if [ -e ~/bin/git-open ]; then
    rm ~/bin/git-open
fi
# copy git-open command and make it executable.
cp $gitopen_path/git-open ~/bin/git-open
chmod u+x ~/bin/git-open

unset remove_or_backup
