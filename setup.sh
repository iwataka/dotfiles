#!/bin/bash

set -e

dfsdir=$(dirname "$0")
dfsdir=$(cd "$dfsdir" && pwd)

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
    if [ -L "$fpath" ]; then
        rm "$fpath"
    fi
    if [ -e "$fpath" ]; then
        mv "$fpath" "$fpath".bak
        echo "make backup file: $fpath.bak"
    fi
}

# Make links of binaries
setup-bins() {
    local bin_directory="$dfsdir/bin"
    for file in "$bin_directory"/*; do
        remove_or_backup ~/bin/"$file"
        if [[ -f "$bin_directory"/"$file" ]]; then
            ln -s "$bin_directory"/"$file" ~/bin/"$file"
        fi
    done
}

setup-symlinks() {
    local files=(vim vimperatorrc vimrc ideavimrc
        zsh zshenv zshrc sh shrc bashrc emacs.d spacemacs sbtrc sbt
        agignore ctags curlrc gitconfig tmux.conf wgetrc atom tigrc
        gnupg ssh peco Xresources hyper.js elvish ghci aws)
    for file in "${files[@]}"; do
        remove_or_backup "$HOME"/."$file"
        ln -s "$dfsdir"/"$file" ~/."$file"
    done
    setup-symlinks-to-config vim nvim
    setup-symlinks-to-config fish fish
    setup-symlinks-to-config alacritty alacritty
}

setup-symlinks-to-config() {
    local from=$1
    local to=$2
    remove_or_backup ~/.config/"${to}"
    ln -s "$dfsdir"/"${from}" ~/.config/"${to}"
}

restore-ssh-config() {
    if [[ -f ~/.ssh.bak/authorized_keys ]] && [[ ! -f ~/.ssh/authorized_keys ]]; then
        mv ~/.ssh.bak/authorized_keys ~/.ssh
    fi
}

if [[ ! -d $dfsdir ]]; then
    git clone https://github.com/iwataka/dotfiles "$dfsdir"
    cd "$dfsdir"
fi
pre-setup
setup-bins
setup-symlinks
restore-ssh-config
