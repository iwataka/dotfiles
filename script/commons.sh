#!/bin/bash

# set project directory
project_dir=$HOME/projects

git_clone_or_pull() {
    local url="$1"
    local path="$2"
    if [ -d $path ]; then
        cd $path
        git pull
    else
        git clone $url $path
        # current directory is the same even if the directory doesn't exist
        cd $path
    fi
}

hg_clone_or_pull() {
    local url="$1"
    local path="$2"
    if [ -d $path ]; then
        cd $path
        hg pull
    else
        hg clone $url $path
        # current directory is the same even if the directory doesn't exist
        cd $path
    fi
}
