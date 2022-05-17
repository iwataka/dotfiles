# shellcheck shell=sh

test -d ~/.local/bin && export PATH=~/.local/bin:"$PATH"
test -d ~/bin && export PATH=~/bin:"$PATH"

while read -r cmd; do
    if [ "$(uname -s)" = "Darwin" ] && brew --prefix "$cmd" >/dev/null 2>&1; then
        if [ "$cmd" = "gawk" ]
        then
            p="$(brew --prefix "$cmd")/bin"
        else
            p="$(brew --prefix "$cmd")/libexec/gnubin"
        fi
        export PATH="$p:$PATH"
    fi
done <<EOF
coreutils
findutils
gnu-sed
grep
gnu-tar
gawk
EOF
