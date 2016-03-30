vim() {
    if [[ $USE_NEOVIM_INSTEAD_OF_VIM == true ]]
    then
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
    else
        command vim "$@"
    fi
}
