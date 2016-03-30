which antigen &> /dev/null
if [ $? != 0 ]; then
    alias g='git'
    alias ga='git add'
    alias gaa='git add --all'
    alias gapa='git add --patch'
    alias gb='git branch'
    alias gba='git branch -a'
    alias gbr='git branch --remote'
    alias gc='git commit -v'
    alias gc!='git commit -v --amend'
    alias gca='git commit -v -a'
    alias gca!='git commit -v -a --amend'
    alias gcl='git config --list'
    alias gclean='git reset --hard && git clean -dfx'
    alias gcm='git checkout master'
    alias gcmsg='git commit -m'
    alias gco='git checkout'
    alias gcount='git shortlog -sn'
    alias gcp='git cherry-pick'
    alias gcs='git commit -S'
    alias gd='git diff'
    alias gdca='git diff --cached'
    alias gl='git pull'
    alias glg='git log --stat --max-count=10'
    alias glgg='git log --graph --max-count=10'
    alias glgga='git log --graph --decorate --all'
    alias glo='git log --oneline --decorate --color'
    alias glog='git log --oneline --decorate --color --graph'
    alias gm='git merge'
    alias gp='git push'
    alias gpoat='git push origin --all && git push origin --tags'
    alias gr='git remote'
    alias grba='git rebase --abort'
    alias grbc='git rebase --continue'
    alias grbi='git rebase -i'
    alias grh='git reset HEAD'
    alias grhh='git reset HEAD --hard'
    alias grmv='git remote rename'
    alias grrm='git remote remove'
    alias grset='git remote set-url'
    alias grt='cd $(git rev-parse --show-toplevel)'
    alias grup='git remote update'
    alias grv='git remote -v'
    alias gss='git status -s'
    alias gst='git status'
    alias gsta='git stash'
    alias gstd='git stash drop'
    alias gstp='git stash pop'
fi
