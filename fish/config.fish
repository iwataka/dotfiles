# I don't check the existence of files (e.g. executables) because I want to see
# the errors explicitly and then install them when needed.

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
test -d ~/.cargo/bin; and fish_add_path -P ~/.cargo/bin

# Make MacOS GNU-compatible
if test (uname -s) = "Darwin"
    for cmd in coreutils findutils gnu-sed grep gnu-tar
        fish_add_path -P (brew --prefix $cmd)/libexec/gnubin
    end
    fish_add_path -P (brew --prefix gawk)/bin
end

# Loading asdf should be at the end of this file to place asdf and its
# executables at the highest priority in PATH environment variable.
if test -z "$ASDF_DIR"
    # Prevent to load twice. It may cause PATH override
    source ~/.asdf/asdf.fish
end
starship init fish |source
zoxide init fish |source

# This imitates Zsh's auto_resume feature.
# If the given command name matches the background job, bring it to foreground
# instead.
function _auto_resume_preexec --on-event fish_preexec
    if string match -rq '\s' "$argv"
        return 0
    end
    set -g _auto_resume_jobid (jobs |
            tail -n -1 |  # delete the first header line
            awk '$5 == "'$argv'"' |  # extract jobs whose command equals to the given one
            head -n 1 |
            awk '{ print $2 }' |  # print Group ID
            string trim)
    if test -n "$_auto_resume_jobid"
        if functions -q "$argv"
            functions -c "$argv" _auto_resume_"$argv"
        end
        function "$argv"
            fg "$_auto_resume_jobid"
        end
    end
end

# Clear some functions and variables craeted by _auto_resume_preexec.
function _auto_resume_postexec --on-event fish_postexec
    if string match -rq '\s' "$argv"
        return 0
    end
    if test -n "$_auto_resume_jobid"
        functions -e "$argv"
        if functions -q _auto_resume_"$argv"
            functions -c _auto_resume_"$argv" "$argv"
            functions -e _auto_resume_"$argv"
        end
        set -e _auto_resume_jobid
    end
end
