if executable('ag')
    let g:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('ack')
    let g:ctrlp_user_command = 'ack --follow --nocolor -g "" %s'
endif

" default ignored directories
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

nnoremap <silent> <Leader>pf :CtrlP<CR>
nnoremap <silent> <Leader>pb :CtrlPBuffer<CR>
nnoremap <silent> <leader>pd :CtrlPDir<cr>
nnoremap <silent> <leader>pv :CtrlP ~/.vim<cr>
nnoremap <silent> <Leader>pm :CtrlPMRU<CR>
" nnoremap <silent> <Leader>l :CtrlPLine %<CR>
" nnoremap <silent> <Leader>u :CtrlPUndo<CR>
" nnoremap <silent> <Leader>r :CtrlPFunky<CR>
