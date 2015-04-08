let vimsettings = '~/.vim/settings'

let s:excluded_paths = []

if !g:use_neocomplete
  call add(s:excluded_paths, 'neocomplete.vim')
  call add(s:excluded_paths, 'neosnippet.vim')
  call add(s:excluded_paths, 'neosnippet-snippets')
endif

if !g:use_ycm
  call add(s:excluded_paths, 'YouCompleteMe')
  call add(s:excluded_paths, 'ultisnips')
  call add(s:excluded_paths, 'vim-snippets')
endif

if !g:use_supertab
  call add(s:excluded_paths, 'supertab')
endif

if !g:use_tmux
  call add(s:excluded_paths, 'vimux')
  call add(s:excluded_paths, 'vim-tmux-navigator')
endif

if !g:use_ctrlp_cmatcher
  call add(s:excluded_paths, 'ctrlp-cmatcher')
endif

if !g:use_ctrlproj
  call add(s:excluded_paths, 'ctrlproj')
endif

" Simply source setting files (detecting os type is in these files).
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  let s:is_excluded = 0
  for p in s:excluded_paths
    if fpath =~ p | let s:is_excluded = 1 | endif
  endfor
  if !s:is_excluded | exe 'source' fpath | endif
endfor
