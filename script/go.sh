#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

go_url="https://github.com/golang/go"
go_path="$project_dir/go"

if [ $OSTYPE == "linux-gnu" ]; then
    if [ -d $go_path ]; then
        cd $go_path
        git pull
    else
        git clone $go_url $go_path
    fi
fi
