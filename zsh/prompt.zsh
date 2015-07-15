# modify the prompt to contain git branch name if applicable

# introduces by mathianbynens
prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") = '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" = 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${blue}${s}";
	else
		echo '';
	fi;
}

# introduced by thoughtbot
# git_prompt_info() {
#     ref=$(git symbolic-ref HEAD 2> /dev/null)
#     if [[ -n $ref ]]; then
#         echo "%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
#     fi
# }

setopt promptsubst
# newline
PS1=$'\n'
# user name
# PS1+='%K{blue}%F{black} [%n@%m] %f%k%K{cyan}%F{blue}%f%k'
# current directory
PS1+='%K{cyan}%F{black} %~ %f%k%K{magenta}%F{cyan}%f%k'
# branch name
PS1+='%K{magenta}%F{black} $(prompt_git) %f%k%F{magenta}%f'
# newline again
PS1+=$'\n'
# start mark
PS1+='%# '
export PS1

# sample prompt of thoughtbot
# export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# simple prompt
# export PS1="%K{blue} [%n] %k%K{cyan} %~ %k%% "

# simple prompt
# export PS1="%F{red}%n%f in %F{green}%~%f %% "

# for zsh-git-prompt
# if [ -e $HOME/.zsh.theme/zsh-git-prompt ]; then
#     source $HOME/.zsh.theme/zsh-git-prompt/zshrc.sh
#     PROMPT='%B%m%~%b$(git_super_status) %# '
# else
#     autoload -U promptinit
#     promptinit
#     prompt fade
# fi

# built-in prompts
# autoload -U promptinit
# promptinit
# prompt fade
