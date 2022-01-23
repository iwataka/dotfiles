# required modules/plugins
type -q fisher; or echo "WARNING: fisher not found"
type -q starship; and starship init fish | source; or echo "WARNING: starship not found"
test -d ~/.asdf; and source ~/.asdf/asdf.fish; or echo "WARNING: asdf not found"

function alias-or-warning
    type -q $argv[3]; and eval "$argv[1] $argv[2] $argv[3]"; or echo "WARNING: $argv[3] not found"
end

# aliases
alias-or-warning alias vim nvim
alias-or-warning abbr v vim
alias-or-warning abbr find fd
alias-or-warning abbr cat bat
alias-or-warning abbr ls exa
alias-or-warning abbr d docker
alias-or-warning abbr g git
alias reload "exec $SHELL"
