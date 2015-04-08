imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.vim/bundle/neosnippet-snippets/neosnippets'
imap <expr><tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<tab>"
