function mkup() {
    if [[ "$@" == "" ]]
    then
        # Here is no compatibility with bash
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

