# TEMPORARILY REPLACE THIS SCRIPT WITH https://github.com/x-motemen/ghq/blob/master/misc/zsh/_ghq

# ghq() {
#     command -v ghq >& /dev/null
#     if [ $? -eq 0 ]; then
#         if [ "$1" = "cd" ]; then
#             ghq-cd "$@[2,-1]"
#         elif [ "$1" = "create" ]; then
#             ghq-create "$@[2,-1]"
#         else
#             command ghq "$@"
#         fi
#     fi
# }

# # This function can't be implemented in Go because Go can't change the current
# # directory of the main process.
# ghq-cd() {
#     command -v peco >& /dev/null
#     if [ $? -eq 0 -a "$#" -eq 0 ]; then
#         local repo_path="$(ghq list -p | peco)"
#         if [ -n "${repo_path}" ]; then
#             cd ${repo_path}
#         fi
#     else
#         local repo_path="$(ghq list -p |grep /$1\$)"
#         if [ -n "${repo_path}" ]; then
#             cd ${repo_path}
#         else
#             ghq_create "$@"
#         fi
#     fi
# }

# ghq-create() {
#     local user="$(git config github.user)"
#     local root="$(ghq root)"
#     if [ -n "${user}" ]; then
#         local project="${root}/github.com/${user}/$1"
#         mkdir ${project}
#         cd ${project}
#         git init
#     fi
# }

# if [[ ! -o interactive ]]; then
#     return
# fi

# # compctl -K _ghq ghq

# _ghq() {
#     # local words completions
#     local cmds
#     # read -cA words

#     # if [ "${#words}" -eq 2 ]; then
#     if (( CURRENT == 2 )); then
#         # completions=$(echo "get\nlist\nlook\nimport\nroot\ncd\ncreate\nhelp\nh\n--version\n-v\n-h")
#         cmds=($(echo "get\nlist\nlook\nimport\nroot\ncd\ncreate\nhelp\nh\n--version\n-v\n-h"))
#         _describe -t commands "sub commands" cmds
#     else
#         # if [ "${words[2,-2]}" = "look" ] || [ "${words[2,-2]}" = "cd" ]; then
#         #     completions=$(ghq list --unique)
#         # fi
#     fi

#     # reply=("${(ps:\n:)completions}")
# }
