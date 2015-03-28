let vimsettings = '~/.vim/settings'

" Simply source setting files (detecting os type is in these files).
for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor

if filereadable('~/settings.local')
  source ~/.vim/settings.vim
endif
