# shellcheck shell=sh

# Create a new directory and enter it
mkd() {
    mkdir -p "$@"
    cd "$@" || return 1
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
o() {
    cmd=""
    # shellcheck disable=SC2039
    if [ "$OSTYPE" = "linux-gnu" ]; then
        cmd="xdg-open"
    elif [ "$OSTYPE" = "cygwin" ]; then
        cmd="cygstart"
    elif [ "$OSTYPE" =~ darwin* ]; then
        cmd="open"
    else
        cmd="start"
    fi
    if [ $# -eq 0 ]; then
        "$cmd" .
    else
        "$cmd" "$@"
    fi
}

replace() {
    ag -l "$1" | xargs sed -i "s/$1/$2/g"
}

xmodmap() {
    if [ $# -eq 0 ] && [ -s "$HOME"/.Xmodmap ]; then
        command xmodmap "$HOME"/.Xmodmap
    else
        command xmodmap "$@"
    fi
}

ls() {
    if exa --version >/dev/null 2>&1; then
        exa "$@"
    else
        command ls -hF --color=auto "$@"
    fi
}

mkup() {
    if [ $# -eq 0 ]; then
        for f in *.md; do
            mkup "$f"
        done
        for f in *.mkd; do
            mkup "$f"
        done
        for f in *.markdown; do
            mkup "$f"
        done
    else
        for f in "$@"; do
            root_name=${f%.*}
            pandoc -s -f markdown_github -o "$root_name".html "$f"
            o "$root_name".html
        done
    fi
}

vim() {
    if nvim --version >/dev/null 2>&1; then
        nvim "$@"
    else
        command vim "$@"
    fi
}
