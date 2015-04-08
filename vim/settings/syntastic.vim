let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ['ruby', 'python'],
  \ "passive_filetypes": []
  \ }
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1

nnoremap <silent> <Leader>si :SyntasticInfo<CR>
nnoremap <silent> <Leader>sc :SyntasticCheck<CR>

if executable('rubocop')
  let g:syntastic_ruby_checkers = ['rubocop']
endif
if executable('flake8')
  let g:syntastic_python_checkers = ['flake8']
endif
