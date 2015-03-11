#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

if [ $OSTYPE == "linux-gnu" ]; then
    local name="gnome-terminal-colors-solarized"
    local url="https://github.com/Anthony25/$name"
    local path="$project_dir/$name"
    git_clone_or_pull $url $path
    ./install.sh
fi
