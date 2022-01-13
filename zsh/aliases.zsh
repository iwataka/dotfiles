# Reload the shell if no background jobs
alias reload='test $(jobs |wc -l) = 0 && exec "$SHELL" -l'
