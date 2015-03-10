#!/bin/bash

# this directory
script_dir=$(cd `dirname $0` && pwd)
# source common settings
source "$script_dir/commons.sh"

scala_url="https://github.com/scala/scala"
scala_path="$project_dir/scala"

if [ $OSTYPE == "linux-gnu" ]; then
    # install scala binaries
    sudo apt-get install scala

    # clones or updates scala repository
    if [ -d $scala_path ]; then
        cd $scala_path
        git pull
    else
        git clone $scala_url $scala_path
    fi

    # install sbt if not exists
    command -v sbt > /dev/null 2>&1 || {
        local text = "deb https://dl.bintray.com/sbt/debian "
        echo $text | sudo tee -a /etc/apt/sources.list.d/sbt.list
        sudo apt-get update
    }
    sudo apt-get install sbt
fi
