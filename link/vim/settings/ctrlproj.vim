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
nnoremap <silent> <Leader>pq :Ctrlproj<CR>
nnoremap <silent> <Leader>pl :CtrlprojLastDir<CR>
nnoremap <silent> <leader>pg :CtrlprojGrep<cr>
nnoremap <silent> <leader>pr :CtrlprojRooter<cr>
nnoremap <silent> <leader>ps :silent only<cr>:CtrlprojVSwitch<cr>
nnoremap <silent> <leader>pa :silent only<cr>:CtrlprojVAlternate<cr>
