#! /bin/bash

# abort if error occurs
set -e
# ask for user password
sudo -v
# get the directory of this script
dotfiles=$(cd `dirname $0` && cd .. && pwd)

# Make directories vim needs
make_dirs() {
    local dirs="vim/backups vim/swaps vim/undo"
    local dir
    for dir in $dirs; do
        if [ ! -d $dotfiles/$dir ]; then
            mkdir $dotfiles/$dir
        fi
    done
}

# Make symbolic links.
make_links() {
    local shell="aliases profile zshenv zshrc zsh_prompt"
    local vim="vim vimrc vimrc.bundles vimperatorrc"
    local scala="sbtrc"
    local misc="agignore ctags gitconfig spacemacs tmux.conf"
    local file
    for file in $shell $vim $scala $misc; do
        make_link . $file
    done
    # neovim
    for file in vim vimrc; do
        make_link .n $file
    done
}

make_link() {
    local prefix=$1
    if [ -L ~/${prefix}${file} ]; then
        rm ~/${prefix}${file}
    fi
    # make backup
    if [ -e ~/${prefix}${file} ]; then
        mv ~/${prefix}${file} ~/${prefix}${file}.backup
    fi
    ln -s $dotfiles/$file ~/${prefix}${file}
}

# chpwd
make_file() {
    if [ ! -e ~/.cache/shell/chpwd-recent-dirs ]; then
        if [ ! -e ~/.cache/shell ]; then
            mkdir ~/.cache/shell
        fi
        touch ~/.cache/shell/chpwd-recent-dirs
    fi
}

make_dirs
make_links
make_file
