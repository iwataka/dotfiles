vim() {
    if ! (( $+_has_working_nvim ))
    then
        nvim --version &> /dev/null
        _has_working_nvim=$(($? == 0))
    fi
    if (( $_has_working_nvim ))
    then
        nvim "$@"
    else
        command vim "$@"
    fi
}
