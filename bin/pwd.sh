#!/usr/bin/env bash

set -e

install_requirements() {
    local platform=$(uname -s)
    if [[ $platform == "Linux" ]]
    then
        apt-get --version &> /dev/null
        local apt_get_found=$(("$?" == 0))
        if $apt_get_found
        then
            sudo apt-get install gnupg
        fi
    fi
}

if [[ ! -d ~/lib/pwd.sh ]]
then
    install_requirements
    git clone https://github.com/drduh/pwd.sh ~/lib/pwd.sh
elif [[ "$1" == "--upgrade" ]]
then
    cd ~/lib/pwd.sh
    git pull origin master
else
    if [[ -s ./pwd.sh.safe ]]
    then
        export PWDSH_SAFE="pwd.sh.safe"
    elif [[ -s ~/projects/private/pwd.sh.safe ]]
    then
        export PWDSH_SAFE="$HOME/projects/private/pwd.sh.safe"
    elif [[ -s ~/lib/pwd.sh/pwd.sh.safe ]]
    then
        export PWDSH_SAFE="$HOME/lib/pwd.sh/pwd.sh.safe"
    fi
    ~/lib/pwd.sh/pwd.sh "$@"
fi

