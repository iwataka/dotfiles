ghq() {
    which ghq >& /dev/null
    if [ $? == 0 ]; then
        if [ $1 == "cd" ]; then
            which peco >& /dev/null
            if [ $? == 0 ]; then
                local repo_path="$(ghq list -p | peco)"
                if [ -n "${repo_path}" ]; then
                    cd ${repo_path}
                fi
            fi
        else
            command ghq "$@"
        fi
    fi
}

if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ghq ghq

_ghq() {
    local words completions
    read -cA words

    if [ "${#words}" -eq 2 ]; then
        completions=$(echo "get\nlist\nlook\nimport\nroot\ncd\nhelp\nh\n--version\n-v\n-h")
    else
        if [ ${words[2,-2]} == "look" ]; then
            completions=$(ghq list --unique)
        fi
    fi

    reply=("${(ps:\n:)completions}")
}
