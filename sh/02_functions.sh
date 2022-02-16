# shellcheck shell=sh

# Create a new directory and move there
mkd() {
    mkdir -p $@
    cd $@ || return 1
}

replace() {
    ag -l "$1" | xargs sed -i "s/$1/$2/g"
}

xmodmap() {
    if [ $# -eq 0 ] && [ -s ~/.Xmodmap ]; then
        command xmodmap ~/.Xmodmap
    else
        command xmodmap $@
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
