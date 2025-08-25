# I don't check the existence of files (e.g. starship) because I want to see
# the errors explicitly and then install them when needed.

abbr v nvim
abbr ls eza
abbr la eza -a
abbr ll eza -l
abbr lla eza -al
abbr cat bat
abbr d docker
abbr g git
abbr reload exec $SHELL
abbr ? gh copilot suggest --target shell

set -x EDITOR nvim -u NONE
set -x VISUAL $EDITOR

if test -n "$NVIM"
    set -x EDITOR nvr --servername $NVIM +'set bufhidden=wipe' --remote-tab-wait
    set -x VISUAL $EDITOR
end

test -d ~/.local/bin; and fish_add_path -P ~/.local/bin
test -d ~/bin; and fish_add_path -P ~/bin
test -d ~/.cargo/bin; and fish_add_path -P ~/.cargo/bin

if test -z "$MISE_SHELL"
    set -x MISE_IDIOMATIC_VERSION_FILE false
    mise activate fish |source
    mise completion fish |source
end

fzf --fish |source
starship init fish |source
zoxide init fish |source
