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

