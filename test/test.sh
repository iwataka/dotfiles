#! /bin/bash

script_dir=$(cd `dirname $0` && pwd)

regex_test() {
    local file_content=`cat $script_dir/fixture/foo.list`
    if [[ "$file_content" =~ deb[[:space:]]http ]]; then
        echo 'regex_test successes'
    else
        echo 'regex_test fails'
    fi
}

echo_test() {
    local arg=`echo ${1}`
    if [[ $arg == $1 ]]; then
        echo 'echo_test successes'
    else
        echo 'echo_test fails'
    fi
}

dot_test() {
    local dot=.
    if [[ $dot == '.' ]]; then
        echo 'dot_test successes'
    else
        echo 'dot_test fails'
    fi
}

tail_test() {
    local arr=($(tail_args 1 2 3))
    if [[ ${arr[0]} == 2 ]]; then
        echo 'tail_test successes'
    else
        echo 'tail_test fails'
    fi
}

tail_args() {
    local arr=$@
    echo ${arr[@]:1}
}

read_test() {
    printf "%s" "Wanna success in read_test? (yes/no) "
    local res
    read res
    if [[ $res =~ (y|yes|Yes|YES) ]]; then
        echo 'read_test successes'
    else
        echo 'read_test fails'
    fi
}

regex_test
echo_test
dot_test
tail_test
read_test
