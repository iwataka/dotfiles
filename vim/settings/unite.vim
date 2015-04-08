if executable('ag')
  let g:unite_source_rec_async_command =
    \ 'ag --follow --nocolor --nogroup -g ""'
  let g:unite_source_grep_command = 'ag'
elseif executable('ack')
  let g:unite_source_rec_async_command =
    \ 'ack --follow --nocolor --nogroup -g ""'
  let g:unite_source_grep_command = 'ack'
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <leader>pp :Unite -start-insert file_rec<cr>
nnoremap <silent> <leader>pb :Unite -start-insert buffer<cr>
nnoremap <silent> <leader>pd :Unite -start-insert directory_rec/async<cr>
nnoremap <silent> <leader>pv :Unite -start-insert -path='~/.vim' file_rec<cr>
