# shellcheck shell=sh

# shellcheck disable=SC2039
bin_dirs=(
    "/usr/local/heroku/bin"
    "$HOME/.anyenv/bin"
    "$HOME/.anyvm/bin"
    "$HOME/.rbenv/bin"
    "$HOME/.pyenv/bin"
    "$HOME/.jenv/bin"
    "$HOME/.gradle/bin"
    "$HOME/.cargo/bin"
    "$HOME/.ghcup/bin"
    "$HOME/.local/bin"
    "$HOME/bin"
)
# shellcheck disable=SC2039
for d in "${bin_dirs[@]}"; do
    if test -d "$d"; then
        export PATH="$d:$PATH"
    fi
done

# shellcheck disable=SC2039
init_cmds=(
    anyenv
    anyvm
    rbenv
    pyenv
    jenv
)
# shellcheck disable=SC2039
for c in "${init_cmds[@]}"; do
    if which "$c" >/dev/null 2>&1; then
        eval "$("$c" init -)"
    fi
done

# shellcheck disable=SC2039
src_files=(
    ~/.gvm/scripts/gvm
    ~/.nvm/nvm.sh
    ~/.dnx/dnvm/dnvm.sh
    ~/.rsvm/rsvm.sh
    ~/.travis/travis.sh
    ~/.jabba/jabba.sh
    ~/.nix-profile/etc/profile.d/nix.sh
)
# shellcheck disable=SC2039
for f in "${src_files[@]}"; do
    # shellcheck disable=SC1090
    test -s "$f" && . "$f"
done

# shellcheck disable=SC2039
gnubin_cmds=(
    coreutils
    findutils
    gsed
    grep
)
# shellcheck disable=SC2039
for c in "${gnubin_cmds[@]}"; do
    if [[ "$OSTYPE" =~ darwin* ]] && brew --prefix "$c" >/dev/null 2>&1; then
        p="$(brew --prefix $c)/libexec/gnubin"
        export PATH="$p:$PATH"
    fi
done
