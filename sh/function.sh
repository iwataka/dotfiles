# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_"
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    local cmd=""
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        cmd="xdg-open"
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        cmd="cygstart"
    elif [[ "$OSTYPE" =~ "darwin*" ]]; then
        cmd="open"
    else
        cmd="start"
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

function xmodmap() {
    if [[ "$@" == "" ]] && [[ -s $HOME/.Xmodmap ]]
    then
        command xmodmap $HOME/.Xmodmap
    else
        command xmodmap "$@"
    fi
}

function ls() {
    exa --version &> /dev/null
    _has_working_exa=$(($? == 0))
    if ((_has_working_exa))
    then
        exa "$@"
    else
        command ls "$@"
    fi
}
