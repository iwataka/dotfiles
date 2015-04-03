nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <leader>gD :Git diff<cr>
nnoremap <Leader>gg :call <sid>GgrepPrompt()<cr>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <leader>gR :Gremove<cr>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gL :Git log<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gA :Git add --all<cr>

fu! s:GgrepPrompt()
  let keyword = input('Keyword? ')
  if keyword != ''
    exe ":Ggrep " . keyword
  else
    echoe "Non-empty keyword is needed!"
  endif
endfu
