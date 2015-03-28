let g:ctrlproj_paths = [
  \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/local/scala',
  \ '/usr/local/jdk',
  \ '~/projects/*',
  \ '~/.vim/bundle/*',
  \ '~/dotfiles'
  \ ]

" fast aliases for ctrlp
nnoremap <silent> <Leader>q :Ctrlproj<CR>
nnoremap <silent> <Leader>l :CtrlprojLastDir<CR>
nnoremap <silent> <leader>x :silent only<cr>:CtrlprojVSwitch<cr>
nnoremap <silent> <leader>a :silent only<cr>:CtrlprojVAlternate<cr>
