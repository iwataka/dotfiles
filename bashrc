# shellcheck shell=bash

# shellcheck disable=SC1090
source "$HOME"/.shrc
alias ..='cd ..'

# shellcheck disable=SC1090
[ -f "$HOME"/.fzf.bash ] && source "$HOME"/.fzf.bash
# shellcheck disable=SC1090
[ -f "$HOME"/.travis/travis.sh ] && source "$HOME"/.travis/travis.sh
# shellcheck disable=SC1090
[ -s "$HOME"/.jabba/jabba.sh ] && source "$HOME"/.jabba/jabba.sh
# shellcheck disable=SC1090
[ -f "$HOME"/.bashrc.local ] && source "$HOME"/.bashrc.local
