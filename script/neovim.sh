#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

neovim_url="https://github.com/neovim/neovim"
neovim_path="$project_dir/neovim"

if [ $OSTYPE == "linux-gnu" ]; then
    if [ -d $project_dir/neovim ]; then
        cd $neovim_path
        git pull
    else
        # build prerequisites
        sudo apt-get install libtool libtool-bin autoconf automake cmake
        sudo apt-get install libncurses5--dev g++ pkg-config unzip
        git clone $neovim_url $neovim_path
        cd $neovim_path
    fi
    make install
fi
