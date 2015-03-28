let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_delimiter = 0
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#auto_completion_start_length = 2
if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer', 'neosnippet']
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
