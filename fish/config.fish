# I don't check the existence of files (e.g. executables) because I want to see
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

set -x EDITOR nvim -u NONE
set -x VISUAL $EDITOR

if test -n "$NVIM"
    set -x EDITOR nvr --servername $NVIM +'set bufhidden=wipe' --remote-tab-wait
    set -x VISUAL $EDITOR
end

test -d ~/.local/bin; and fish_add_path -P ~/.local/bin
test -d ~/bin; and fish_add_path -P ~/bin
test -d ~/.cargo/bin; and fish_add_path -P ~/.cargo/bin

set -x MISE_IDIOMATIC_VERSION_FILE false
mise activate fish |source
mise completion fish |source

fzf --fish |source
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
