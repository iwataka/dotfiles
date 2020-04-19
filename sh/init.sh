# shellcheck shell=sh

# shellcheck disable=SC1090
test -s "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh" &&
    . "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh" >/dev/null

# Fix tmux problem in Cygwin
# shellcheck disable=SC2039
test "$OSTYPE" = "cygwin" && rm -rf /tmp/tmux-*

# Changes code page to UTF-8.
# shellcheck disable=SC2039
if test "$OSTYPE" = "cygwin"; then
    chcp 65001
    # shellcheck disable=SC1090
    test -s "$HOME"/.profile && . "$HOME"/.profile
fi

# use vim the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# shellcheck disable=SC2039
test "$OSTYPE" = "linux-musl" &&
    export PAGER='less' ||
    export PAGER='less -r' &&
    export LESS='-r -N -s'
export TERM=screen-256color-bce
