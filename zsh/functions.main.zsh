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
        for mkd in *.(md|mkd|markdown)
        do
            mkup $mkd
        done
    else
        for mkd in "$@"
        do
            root_name=${mkd%.*}
            pandoc -s $mkd -o ${root_name}.html
            o ${root_name}.html
        done
    fi

}
