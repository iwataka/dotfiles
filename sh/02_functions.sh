# shellcheck shell=sh

# Create a new directory and move there
mkd() {
    mkdir -p "$@"
    cd "$@" || return 1
}

replace() {
    ag -l "$1" | xargs sed -i "s/$1/$2/g"
}

xmodmap() {
    if [ $# -eq 0 ] && [ -s ~/.Xmodmap ]; then
        command xmodmap ~/.Xmodmap
    else
        command xmodmap "$@"
    fi
}
