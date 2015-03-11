#!/bin/bash

script_dir=$(cd `dirname $0` && pwd)

if [ $OSTYPE == "linux-gnu" ]; then
    gnome-terminal-colors-solarized/install.sh
fi
