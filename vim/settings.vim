let vimsettings = '~/.vim/settings'

let s:excluded_paths = []

" Simply source setting files (detecting os type is in these files).
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  let s:is_excluded = 0
  for p in s:excluded_paths
    if fpath =~ p | let s:is_excluded = 1 | endif
  endfor
  if !s:is_excluded | exe 'source' fpath | endif
endfor
