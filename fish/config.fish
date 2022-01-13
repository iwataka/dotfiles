if not type -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

test -d ~/.sh && source ~/.sh/04_aliases.sh

alias reload='test (jobs |wc -l) = 0 && exec "$SHELL" -l'

if type -q starship
    starship init fish | source
end
