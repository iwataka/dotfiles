"----------------------------------------------------------------
" Loading plugins
"----------------------------------------------------------------
" If using Windows Vim, you should manually add .vim directory to runtime path.
if has("win32") || has("win64")
    set runtimepath+=~/.vim/
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" auto completion (depending on OS type)
if (has("win32") || has("win64") || has("win32unix")) && has("lua")
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Shougo/neosnippet.vim'
    Plugin 'Shougo/neosnippet-snippets'
elseif has('unix') && has("python")
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
else
    Plugin 'ervandew/supertab'
endif

" cooperation with vimux (in gui only)
if !has('gui_running')
    Plugin 'benmills/vimux'
    Plugin 'christoomey/vim-tmux-navigator'
endif

" This plugin is unstable with nerdtree.
Plugin 'tpope/vim-fugitive'

" Save the time to add close brackets.
Plugin 'Raimondi/delimitMate'

" ctrlp and fast matcher
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'iwataka/ctrlproj.vim'

" useful key-mappings
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'

" motion helper
Plugin 'haya14busa/incsearch.vim'

" display useful information
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'

" depending on filetypes
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'

" local configuration for plugins
if filereadable(expand('~/.vundles.vim.local'))
    source ~/.vundles.vim.local
endif

call vundle#end()
filetype plugin indent on

"----------------------------------------------------------------
" vim-plug
"----------------------------------------------------------------
let g:plug_timeout = 100000000

"----------------------------------------------------------------
" autocompletion and snippets
"----------------------------------------------------------------
if (has("win32") || has("win64") || has("win32unix")) && has("lua")
    " neocomplete
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_delimiter = 0
    let g:neocomplete#sources#syntax#min_keyword_length = 4
    let g:neocomplete#auto_completion_start_length = 2
    if !exists('g:neocomplete#sources')
        let g:neocomplete#sources = {}
    endif
    let g:neocomplete#sources._ = ['buffer', 'neosnippet']
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " neosnippet
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
elseif has('unix') && has("python")
    " ycm
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_key_detailed_diagnostics = ''
    " ultisnips
    let g:UltiSnipsListSnippets="<c-tab>"
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    let g:UltiSnipsSnippetsDir="~/.vim/snippets"
endif

"----------------------------------------------------------------
" ctrlp
"----------------------------------------------------------------
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

" use pymatcher
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
endif

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
nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
nnoremap <silent> <Leader>q :Ctrlproj<CR>
nnoremap <silent> <Leader>l :CtrlprojLastDir<CR>
nnoremap <silent> <leader>x :silent only<cr>:CtrlprojVSwitch<cr>
nnoremap <silent> <leader>a :silent only<cr>:CtrlprojVAlternate<cr>
nnoremap <silent> <leader>d :CtrlPDir<cr>
" below three mappings is less frequently used
" nnoremap <silent> <Leader>l :CtrlPLine %<CR>
" nnoremap <silent> <Leader>u :CtrlPUndo<CR>
" nnoremap <silent> <Leader>r :CtrlPFunky<CR>

"----------------------------------------------------------------
" fugitive
"----------------------------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gL :Git log<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gA :Git add --all<cr>

"----------------------------------------------------------------
" incsearch
"----------------------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)

"----------------------------------------------------------------
" syntastic
"----------------------------------------------------------------
let g:syntastic_mode_map = { "mode": "passive",
                        \ "active_filetypes": [],
                        \ "passive_filetypes": [] }
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
nnoremap <silent> <Leader>si :SyntasticInfo<CR>
nnoremap <silent> <Leader>sc :SyntasticCheck<CR>

"----------------------------------------------------------------
" gitgutter
"----------------------------------------------------------------
" let g:gitgutter_sign_added = '✚'
" let g:gitgutter_sign_modified = '➜'
" let g:gitgutter_sign_removed = '✘'

"----------------------------------------------------------------
" lightline
"----------------------------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['gitgutter', 'fugitive'],
    \       ['filename', 'modified', 'readonly']
    \   ],
    \   'right': [
    \       ['lineinfo', 'syntastic'],
    \       ['percent'],
    \       ['charcode', 'fileformat', 'fileencoding', 'filetype']
    \   ]
    \ },
    \ 'component_function': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \   'gitgutter': 'MyGitGutter',
    \   'fugitive': 'MyFugitive',
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadOnly'
    \ }
    \ }

let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
function! CtrlPEnter()
    let w:lightline = 0
endfunction

function! MyFugitive()
    if exists('*fugitive#statusline')
        retu fugitive#statusline()
    endif
endfunction

function! MyReadOnly()
    if &readonly
        retu 'RO'
    else
        retu ''
    endif
endfunction

function! MyModified()
    if &modified
        retu '[+]'
    else
        retu ''
    endif
endfunction

function! MyGitGutter()
    if !exists('*GitGutterGetHunkSummary')
            \ || !get(g:, 'gitgutter_enabled', 0)
            \ || winwidth('.') <= 90
        return ''
    en
    let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
        call add(ret, symbols[i].hunks[i])
    endfo
    return join(ret, ' ')
endf

"----------------------------------------------------------------
" vim-scala
"----------------------------------------------------------------
nnoremap <silent> <Leader>ss :SortScalaImports<CR>
let g:scala_sort_across_groups=0
