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

# This imitates Zsh's auto_resume feature.
# If the given command name matches the background job, bring it to foreground
# instead of executing it newly.
function _auto_resume_preexec --on-event fish_preexec
    # Check if the given commmand includes any white space (that is followed by args).
    # If so, skip auto-resume.
    if string match -rq '\s' "$argv"
        return 0
    end
    # Get the job ID of the background job whose command equals to the given one.
    set -g _auto_resume_jobid (jobs |
            # delete the first header line
            tail -n -1 |
            # extract jobs whose command (without args) equals to the given one
            awk '$5 == "'$argv'"' |
            # extract only the first match
            head -n 1 |
            # extract Group ID
            awk '{ print $2 }' |
            string trim)
    if test -n "$_auto_resume_jobid"
        # If the given command is function, save it as an alias.
        if functions -q "$argv"
            functions -c "$argv" _auto_resume_"$argv"
        end
        # Create the function which brings the job to foreground and
        # override the given command by the function.
        function "$argv"
            fg "$_auto_resume_jobid"
        end
    end
end

# Delete some functions and variables created by _auto_resume_preexec.
function _auto_resume_postexec --on-event fish_postexec
    # Check if auto-resume is done.
    if test -n "$_auto_resume_jobid"
        # Delete the function overriding the original command.
        functions -e "$argv"
        # Restore the original function if it exists.
        if functions -q _auto_resume_"$argv"
            functions -c _auto_resume_"$argv" "$argv"
            functions -e _auto_resume_"$argv"
        end
        # Delete the jobid created by _auto_resume_preexec.
        set -e _auto_resume_jobid
    end
end
