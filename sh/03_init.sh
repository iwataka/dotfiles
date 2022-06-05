# shellcheck shell=sh

# shellcheck disable=SC1090
test -f ~/.vim/plugged/gruvbox/gruvbox_256palette.sh &&
    . ~/.vim/plugged/gruvbox/gruvbox_256palette.sh >/dev/null

# Fix tmux problem in Cygwin
# shellcheck disable=SC2039,SC3028
test "$OSTYPE" = "cygwin" && rm -rf /tmp/tmux-*

# Changes code page to UTF-8.
# shellcheck disable=SC2039,SC3028
if test "$OSTYPE" = "cygwin"; then
    chcp 65001
    # shellcheck disable=SC1090
    test -s ~/.profile && . ~/.profile
fi

# use vim the visual editor
export VISUAL="vim -u NONE"
export EDITOR="$VISUAL"

# shellcheck disable=SC2039,SC3028
test "$OSTYPE" = "linux-musl" &&
    export PAGER='less' ||
    export PAGER='less -r' &&
    export LESS='-r -N -s'

test -z "$TERM" && export TERM=screen-256color-bce
