# I don't check the existence of files (e.g. executables) because I want to see
# the errors explicitly and then install them.

abbr v nvim
abbr ls exa
abbr la exa -a
abbr ll exa -l
abbr lla exa -al
abbr cat bat
abbr d docker
abbr g git
abbr reload exec $SHELL

set -x EDITOR nvim -u NONE
set -x VISUAL $EDITOR

if test -n "$NVIM"
    set -x EDITOR nvr --servername $NVIM +'set bufhidden=wipe' --remote-tab-wait
    set -x VISUAL $EDITOR
end

test -d ~/.local/bin; and fish_add_path -P ~/.local/bin
test -d ~/bin; and fish_add_path -P ~/bin

# Make MacOS GNU-compatible
if test (uname -s) = "Darwin"
    for cmd in coreutils findutils gnu-sed grep gnu-tar
        fish_add_path -P (brew --prefix $cmd)/libexec/gnubin
    end
    fish_add_path -P (brew --prefix gawk)/bin
end

# Loading asdf should be at the end of this file to place asdf and its
# executables at the highest priority in PATH environment variable.
source ~/.asdf/asdf.fish
starship init fish |source
zoxide init fish |source
