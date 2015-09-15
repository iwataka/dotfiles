# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    local cmd=""
    if [[ $OSTYPE == "linux-gnu" ]]; then
        cmd="xdg-open"
    elif [[ $OSTYPE == "cygwin" ]]; then
        cmd="cygstart"
    else
        cmd="open"
    fi
    if [ $# -eq 0 ]; then
        $cmd .
    else
        $cmd "$@"
    fi;
}

function replace() {
    ag -l $1 |xargs sed -i "s/$1/$2/g"
}

function psg() {
    ps -ef |grep "$@"
}

function mkup() {
    if [[ "$@" == "" ]]
    then
        for markdown in *.(md|mkd|markdown)
        do
            mkup $markdown
        done
    else
        for markdown in "$@"
        do
            root_name=${markdown%.*}
            pandoc -s -f markdown_github -o ${root_name}.html $markdown
            o ${root_name}.html
        done
    fi
}

function xmodmap() {
    if [[ "$@" == "" ]] && [[ -s $HOME/.Xmodmap ]]
    then
        command xmodmap $HOME/.Xmodmap
    else
        command xmodmap "$@"
    fi
}
