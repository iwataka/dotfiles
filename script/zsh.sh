#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

antigen_url="https://github.com/zsh-users/antigen"

if [ $OSTYPE == "linux-gnu" ]; then
    if [ -d $HOME/.antigen ]; then
        cd $HOME/.antigen
        git pull
    else
        git clone $antigen_url ~/.antigen
        cd ~/.antigen
    fi
fi
