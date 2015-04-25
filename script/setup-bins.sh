#!/bin/bash

set -e

# dotfiles directory
dfsdir=$(cd `dirname $0` && cd .. && pwd)

# copy binaries and make them executable
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

# make binary directory for user
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

setup-bins
install-git-open
