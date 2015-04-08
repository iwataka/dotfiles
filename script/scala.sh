#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

scala_url="https://github.com/scala/scala"
scala_path="$project_dir/scala"

if [ $OSTYPE == "linux-gnu" ]; then
    # clones or updates scala repository
    if [ -d $scala_path ]; then
        cd $scala_path
        git pull
    else
        git clone $scala_url $scala_path
    fi
fi
