ghq-cd() {
    filters=(peco fzf)
    for filter in "${filters[@]}"; do
        if command -v "$filter" > /dev/null 2>&1; then
            repo_path="$(ghq list -p | $filter)"
            if [ -n "$repo_path" ]; then
                cd "$repo_path" || return 1
            fi
            return 0
        fi
    done
}

ghq-import() {
    origin_url=$(git config remote.origin.url)
    if [ ! $? -eq 0 ]; then
        echo "you are not in Git repository or remote.origin.url is not set" >&2
        return 1
    fi
    rel_path="$(echo "$origin_url" |awk -F'://' '{print $2}')"
    rel_path_trimmed=$(dirname "$rel_path")/${$(basename "$rel_path")%.git}

    ghq_root="$(ghq root)"
    src="$(git rev-parse --show-toplevel)"
    dest="${ghq_root%/}/$rel_path_trimmed"
    if [ "$src" = "$dest" ]; then
        echo "already imported" >&2
        return 1
    fi
    if [ -d "${dest}" ]; then
        echo "unable to import because ${dest} already exists" >&2
        return 1
    fi

    echo "move ${src} -> ${dest}"
    if read -q "?continue?(y|n)"; then
        echo
    else
        echo
        echo abort >&2
        return 1
    fi

    cd "$(dirname "$src")" || return 1
    mkdir -p "$(dirname "$dest")"
    mv "$src" "$dest"
}
