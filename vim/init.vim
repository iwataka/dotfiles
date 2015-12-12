" Awesome vimrc
" junegunn - https://github.com/junegunn/dotfiles/blob/master/vimrc
" martin-svk - https://github.com/martin-svk/dot-files/blob/master/neovim/init.vim
" amix - https://github.com/amix/vimrc

" Awesome color scheme
" vim-hybrid - https://github.com/w0ng/vim-hybrid
" molokai -
" monokai -
" jellybeans -
" gruvbox -
" iceberg -
" vividchalk -
" zenburn -
" base16 -
" wombat -
" badwolf -
" lucius -
" atom-dark -

" Color scheme gallery
" vimcolor - http://vimcolor.com

" Direct Codepoint Entry
" <C-V>165 -> ¥
" <C-V>xb1 -> ±
" <C-V>u2211 -> ∑
" <C-V>U0001F609 -> 😉
" Other difficult-to-input characters
" <C-V><Enter> -> 

" ===============================================================
" VIM-PLUG BLOCK {{{1
" ===============================================================
" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Use ~/.vim as a runtime path even in Windows
if has("win32") || has("win64")
  set runtimepath+=~/.vim/
endif

silent! if plug#begin('~/.vim/plugged')

" Completion
if has('python')
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
  Plug 'SirVer/ultisnips', { 'on': [] }
  Plug 'honza/vim-snippets', { 'on': [] }
endif

" Git
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim', { 'on': ['Gist'] }
Plug 'mattn/webapi-vim'

" Fancy
" Plug 'bling/vim-airline'  " Waste time on startup
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim', { 'on': ['Calendar'] }
Plug 'Yggdroot/indentLine'

" Navigation
" if v:version >= 703
"   Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }  " Hardly used
" endif
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
if has('unix') || has('mac') || has('macunix')
  Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
elseif has('python')
  Plug 'FelikZ/ctrlp-py-matcher'
endif

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
" This plug-in causes errors while inputting japanese characters
" in GVim, so you should execute :DelimitMateOff for it.
Plug 'Raimondi/delimitMate'
" Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular', { 'on': ['Tabularize'] }
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeForcus'] }
" If you want to use syntastic, you must disable vim-auto-save plugin.
" Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/vim-auto-save'

" Colorscheme
Plug 'altercation/vim-colors-solarized'

" Filetype
if v:version >= 703
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
endif
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
if has('unix') || has('mac')
  Plug 'suan/vim-instant-markdown', { 'for': 'mkd' }
endif
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'jamessan/vim-gnupg', { 'for': 'gnupg' }

call plug#end()
endif

filetype plugin on
filetype indent on

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim  " Move between if and else
endif

" ===============================================================
" BASIC SETTINGS {{{1
" ===============================================================

" The mapleader is used as a prefix for all user mappings.
let mapleader      = " "  " Space can be typed by both of hands.
let maplocalleader = "\\"  " The local mapleader is hardly used.

let $LANG='en'                            " Vim should be in English
if has('vim_starting')
  set encoding=utf-8
endif
set fileencodings=utf-8,sjis              " UTF8 is first, SJIS is second
set fileformats=unix,dos,mac              " Unix format has highest priority
set timeout                               " Enable timeout settings
set timeoutlen=1000                       " Time out on mapping after 1 second
set ttimeoutlen=100                       " Time out on key codes after 0.1 second
set lazyredraw                            " Not be redrawn while executing macros and so on
set showmatch                             " Show pairs of brackets
set matchtime=1                           " Tenths of a second to show the mathing paren
set textwidth=0                           " No limit for text width
set pumheight=10                          " Limit the height of popup menu
set splitright                            " More natural way to split a window vertically
set splitbelow                            " More natural way to split a window horizontally
set expandtab                             " Use spaces for indenting
set smarttab                              " Use spaces for inserting <Tab>
set autoindent                            " Same as the above indent
set smartindent                           " Smart autoindenting
set noerrorbells                          " No beep or screen flash for error messages
set visualbell t_vb=                      " No beeping, use visual bell
set shortmess+=atI                        " Some visual settings
set scrolloff=3                           " Keep some lines
set showcmd                               " Show command in the last line
set cmdheight=2                           " The height of command line
set ruler                                 " Show the cursor position in status line
set showmode                              " Show mode in the last line
set laststatus=2                          " last window will have a status line
set history=1000                          " A history in command line
set autowrite                             " Write contents of modified files automatically
set autoread                              " Detect changes from outside automatically
set backspace=indent,eol,start            " Enable backspace to delete more than characters
set hidden                                " A bufffer becomes hidden when it is abandoned
set nostartofline                         " Jump to certain positions, not starts of line
set ignorecase                            " Case insensitive by default
set smartcase                             " Case sensitive when containing capitals
set magic                                 " Make using regex more easier
set incsearch                             " Enable incremental search
set hlsearch                              " Highlight search results
nohlsearch                                " Prevetnt highlight when reloading .vimrc
set ttyfast                               " Enable fast connection
set foldenable                            " Enable to fold
set foldlevel=2                           " Start folding at the second depth
set foldmethod=marker                     " Use specified markers to fold sentences
set foldopen+=jump,search                 " Open foldings when jumping to them
set allowrevins                           " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set colorcolumn=81

set wildmenu
set wildignorecase
set wildmode=list:full
set wildignore+=.git,.hg,.svn,.bzr,_darcs        " VCS
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.luac                           " Lua
set wildignore+=*.pyc                            " Python
set wildignore+=*.rbc                            " Ruby
set wildignore+=*.class                          " JVM

if has('win32') || has('win64')
  set imdisable
endif

set clipboard=unnamed
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

set number
if exists('&relativenumber')
  set relativenumber
endif

if has('title')
  set title
endif

if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if has('gui_running')
  set guioptions=
  silent! set guifont=Hack\ 12
endif

if has('mouse')
  set mouse=a
  set mousehide
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j  " Delete comment character when joining commented line
endif

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undolevels=100
  set undofile
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --column
elseif executable('ack')
  set grepprg=ack\ -H\ --nocolor\ --nogroup
else
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" ===============================================================
" AUTOCMD {{{1
" ===============================================================

augroup vimrcEx
  autocmd!

  " Use cursorline only in the focused window.
  " This doesn't work with NERDTree.
  " Currently disabled because of performance issue.
  " autocmd WinEnter * set cursorline
  " autocmd WinLeave * set nocursorline

  " When editing a file, always jump to the last known cursor position.
  " do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " Markdown
  autocmd FileType mkd setlocal spell
  autocmd FileType mkd setlocal commentstring=<!--\ %s\ -->

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Comment strings
  autocmd FileType dosbatch setlocal commentstring=rem\ %s

  " Allows C-style comment
  autocmd FileType json setlocal commentstring=//\ %s

  " Quit help buffer by typing just q.
  autocmd FileType help
    \ if &readonly | nnoremap <buffer> q :q<cr> | endif

  autocmd FileType java,c,cpp
    \ if executable('astyle') |
    \   setlocal formatprg='astyle' |
    \ endif

  " Set some filetypes for some cetain files
  autocmd BufRead,BufNew *spacemacs setlocal filetype=lisp
  autocmd BufRead,BufNew *.gradle setlocal filetype=groovy
  autocmd BufRead,BufNew *editorconfig setlocal filetype=jproperties
  autocmd BufRead,BufNew *.gpg setlocal filetype=gnupg

  " write comments easily for any files
  autocmd BufRead,BufNewFile * set formatoptions+=ro

  " emphasize comments
  autocmd BufRead,BufNew * hi Comment term=bold

  " prevent from conflicting multiple edit
  autocmd SwapExists * let v:swapchoice = 'o'

  " Full-width spaces
  autocmd BufRead,BufNew * hi FullWidthSpace cterm=underline ctermbg=red guibg=#666666
  autocmd BufRead,BufNew * match FullWidthSpace /　/

  " Automatically open the quickfix window
  autocmd QuickFixCmdPost * cwindow

  " Automatically remove trailing spaces when saving
  " NOTE: This feature has bad effects for undo function.
  " autocmd BufWritePre * call s:preserve('%s/\s*$//')
augroup END

" ===============================================================
" MAPPINGS {{{1
" ===============================================================

" More reasonable cursor moving
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Prevent to override registers by one character
nnoremap x "_x

" Better jumping to marks
nnoremap ' `
nnoremap ` '

" jk | Escaping!
inoremap jk <Esc>
cnoremap jk <C-c>
if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <ESC> <C-\><C-n>
endif

" Edit vimrc
nnoremap <leader>ev :vsplit ~/.vim/init.vim<cr>
" Source vimrc
nnoremap <leader>sv :source ~/.vimrc<cr>
" Source the current buffer
nnoremap <leader>sc :source %<cr>

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Save
if has('nvim')
  inoremap <C-s> <C-O>:update<cr>
  nnoremap <C-s> :update<cr>
  nnoremap <Leader>w :update<CR>
else
  " update command causes unknown error in Vim.
  inoremap <C-s> <C-O>:w<cr>
  nnoremap <C-s> :w<cr>
  nnoremap <Leader>w :w<CR>
endif
cnoremap w!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>q :q<cr>

" Hide other visibie buffers
nnoremap <leader>o :only<cr>

" Command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <expr> %% expand("%")

" Scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

" Scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Circular window navigation
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" Clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :nohlsearch<cr><C-l>
nnoremap <silent> <Esc><Esc> :nohlsearch<cr><C-l>

" Increment and decrement numbers by + and - keys.
" Tmux uses <c-a> key as a prefix, so Vim can't use it.
nnoremap + <c-a>
nnoremap - <c-x>

" Select all.
nnoremap <c-a> gg^vG$

" Changes the current working directory to the directory of focused buffer
nnoremap <leader>cd  :cd %:h<cr>

" Make <C-u> behave like being on command line
inoremap <C-u> <C-g>u<C-u>

" Search in visual mode
xnoremap <silent> * :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal n<cr>
xnoremap <silent> # :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal N<cr>

" Double <BS> to remove trailing spaces
nnoremap <silent> <BS><BS> :call <sid>preserve('%s/\s*$//')<cr>

" :checktime is frequently used
nnoremap <leader>ct :checktime<cr>

" Some mappings for user-defined commands
nnoremap <silent> <leader>cb :CheckboxToggle<cr>
nnoremap <silent> <leader>rt :Root<cr>
if !maparg('<tab>', 'i') | inoremap <expr> <tab> <sid>super_duper_tab("\<c-n>", "\<tab>") | endif
if !maparg('<tab>', 'i') | inoremap <expr> <S-tab> <sid>super_duper_tab("\<c-p>", "\<tab>") | endif

" ===============================================================
" FUNCTIONS & COMMANDS {{{1
" ===============================================================

" Clear all buffers by bdelete command.
" If unsaved buffers exist, this command fails.
com! -bang -complete=file -nargs=? BufClear call s:bufclear(<bang>0, <q-args>)
function! s:bufclear(bang, path)
  let lastnr = bufnr('$')
  let abs_path = a:path == '' ? '' : fnamemodify(expand(a:path), ':p')
  " buffer number starts from 1
  let i = 1
  wh i <= lastnr
    let name = fnamemodify(bufname(i), ':p')
    " Terminal buffers can't be deleted automatically.
    if getbufvar(i, "&buftype") != "terminal"
      if bufexists(i) &&
          \ (abs_path == '' || (filereadable(name) && name =~ abs_path.'*'))
        silent exe 'bwipeout '.i
      elseif a:bang && bufloaded(i)
        silent exe 'bdelete '.i
      endif
    endif
    let i = i + 1
  endwh
endfunction

" Changes the current directory to the project root
com! Root call s:cd_root()
fu! s:cd_root()
  let cwd = fnamemodify(expand('%'), ':p:h')
  let root = s:root(cwd)
  if empty(root)
    echom 'Not in a project'
  else
    echom 'Changes the current directory to: '.root
    silent exe 'cd '.root
  endif
endfu
fu! s:root(cwd)
  let rmarkers = ['.git', '.hg', '.svn', '.bzr', '_darcs']
  for mark in rmarkers
    let rdir = finddir(mark, a:cwd.';')
    if !empty(rdir)
      retu fnamemodify(rdir, ':h')
    endif
  endfor
  retu ''
endfu

com! Tab2Spaces call s:tab_to_spaces()
fu! s:tab_to_spaces()
  if search('\t', 'n')
    let num = &tabstop
    let spaces = ''
    for i in range(num)
      let spaces = spaces.' '
    endfor
    silent exe '%s/\t/'.spaces.'/'
  endif
endfu

" Execute a given command with the cursor position and the search register
" preserved.
fu! s:preserve(cmd)
  let _s = @/
  let l = line(".")
  let c = col(".")
  exe a:cmd
  let @/ = _s
  call cursor(l, c)
endfu

" Returns the text in the current visual selection.
fu! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1 :]
  return lines
endfu

fu! s:get_search_pattern()
  let lines = map(s:get_visual_selection(), "escape(v:val, ' \\/.*$^~[]')")
  retu join(lines, '\n')
endfu

fu! s:get_grep_pattern()
  let lines = s:get_visual_selection()
  let lines = map(lines, "escape(v:val, '\\')")
  let lines = map(lines, "escape(v:val, ' /.*+#$?^~\[\]()|')")
  let lines = map(lines, "escape(v:val, '\\')")
  " Escape single quotes.
  let lines = map(lines, "escape(v:val, \"''\")")
  " Escape double quotes.
  let lines = map(lines, "escape(v:val, '\"')")
  retu join(lines, '\n')
endfu

com! CheckboxToggle call s:toggle_check_box(line('.'))
fu! s:toggle_check_box(linenr)
  let line = getline(a:linenr)
  if line =~ '[-+*]\s*\[x\]'
    let line = substitute(line, '\([-+*]\s*\[\)x\(\]\)', '\1'.' '.'\2', '')
  elseif line =~ '[-+*]\s*\[\s*\]'
    let line = substitute(line, '\([-+*]\s*\[\)\s*\(\]\)', '\1'.'x'.'\2', '')
  endif
  call setline(a:linenr, line)
endfu

" derived from junegunn's vimrc
fu! s:super_duper_tab(k, o)
  if pumvisible()
    return a:k
  endif
  let line = getline('.')
  let col = col('.') - 2
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
    return a:o
  endif
  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if prefix =~ '^[~/.]'
    return "\<c-x>\<c-f>"
  endif
  if s:can_complete(&omnifunc, prefix)
    return "\<c-x>\<c-o>"
  endif
  if s:can_complete(&completefunc, prefix)
    return "\<c-x>\<c-u>"
  endif
  return a:k
endfu

fu! s:can_complete(func, prefix)
  if empty(a:func) || call(a:func, [1, '']) < 0
    return 0
  endif
  let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
  return !empty(type(result) == type([]) ? result : result.words)
endfu

" " Settings about japanese and english input sources
" if has('unix')
"   let s:default_input_source = "mozc-jp"
"   let s:ibus = !empty(system('ibus engine 2> /dev/null'))
"   aug vimrc-jp
"     au!
"     au InsertLeave * call s:on_insert_leave()
"   aug END
" endif

" " Execute this when leaving from insert mode.
" fu! s:on_insert_leave()
"   silent call s:switch_input_source_to_default()
" endfu

" " Switch current input source to the default
" fu! s:switch_input_source_to_default()
"   if s:current_input_source() != s:default_input_source
"     if s:ibus
"       silent call system('ibus engine '.s:default_input_source)
"     endif
"   endif
" endfu

" " Returns current input source
" fu! s:current_input_source()
"   if s:ibus
"     return substitute(system('ibus engine'), '\(\n\|\r\)', '', '')
"   else
"     return ''
"   endif
" endfu

" com! InputRestart call s:input_restart()
" fu! s:input_restart()
"   if s:ibus
"     silent call system('ibus restart')
"   endif
"   sleep 300m
"   silent call s:switch_input_source_to_default()
" endfu

com! MarkdownPreview call s:markdown_preview()
fu! s:markdown_preview()
  let current_name = fnamemodify(expand('%'), ':p')
  let target_name =  fnamemodify(current_name, ':r').'.html'
  if executable('pandoc')
    silent exec '!pandoc -s -f markdown_github '.current_name.' -o '.target_name
    call s:open(target_name)
  else
    echoe 'Require Pandoc!'
  endif
endfu

com! -nargs=* -complete=file Open call s:open(<q-args>)
fu! s:open(target)
  let command = ''
  if has('unix')
    let command = 'xdg-open'
  elseif has('mac')
    let command = 'open'
  elseif has('win32unix')
    let command = 'cygstart'
  else
    let command = 'start'
  endif
  if empty(a:target)
    silent exec '!'.command.' '.shellescape(expand('%:p'))
  else
    silent exec '!'.command.' '.a:target
  endif
  redraw!
endfu

com! Todo call s:todo()
fu! s:todo()
  silent! grep TODO
  silent! grepadd FIXME
  silent! grepadd OPTIMIZE
  silent! grepadd HACK
  silent! grepadd REVIEW
  silent! grepadd CHANGED
  silent! grepadd XXX
  silent! grepadd IDEA
  silent! grepadd NOTE
endfu

com! Make call <sid>make_current_project()
fu! s:make_current_project()
  let files = split(system('ls'), '\n')
  for file in files
    if file == "Makefile"
      !make
      return
    elseif file == "Rakefile"
      !rake
      return
    endif
  endfor
  make
endfu

com! -nargs=* Run call <sid>run_this_script(<q-args>)
fu! s:run_this_script(args)
  if &filetype == 'python'
    exe '!python '.expand('%').' '.args
  elseif &filetype == 'ruby'
    exe '!ruby '.expand('%').' '.args
  else
    exe '!'.expand('%').' '.args
  endif
endfu

com! A call s:alternate(expand('%'), 'edit')
com! AV call s:alternate(expand('%'), 'vsplit')
com! AS call s:alternate(expand('%'), 'split')
" Test files are detected by the suffixes `Test` or `Spec`.
fu! s:alternate(fname, cmd)
  let root_name = fnamemodify(a:fname, ':p:r')
  let extension = fnamemodify(a:fname, ':e')

  " C language source and header files
  if extension == 'c'
    silent exe a:cmd.' '.root_name.'.h'
    return
  elseif extension == 'h'
    silent exe a:cmd.' '.root_name.'.c'
    return
  endif

  " File separator depends on OS
  let separator = '/'
  if has('win32') || has('win64')
    let separator = '\'
  endif

  " General source and test files
  let is_test = (root_name =~ '.*\(Test\|Spec\|_test\|_spec\)')
  if is_test
    let root_name = substitute(root_name, 'test'.separator, 'main'.separator, '')
    let root_name = substitute(root_name, '\(Test\|Spec\|_test\|_spec\)$', '', '')
    call s:open_file(root_name.'.'.extension, a:cmd)
  else
    let root_name = substitute(root_name, 'main'.separator, 'test'.separator, '')
    " Possible test patterns
    let camel_test = root_name.'Test.'.extension
    let camel_spec = root_name.'Spec.'.extension
    let snake_test = root_name.'_test.'.extension
    let snake_spec = root_name.'_spec.'.extension
    " Determine the most reasonable pattern by the current file type
    if &ft == 'java' || &ft == 'scala'
      let finally_created = camel_test
    elseif &ft == 'go'
      let finally_created = snake_test
    endif
    if filereadable(camel_test)
      call s:open_file(camel_test, a:cmd)
    elseif filereadable(camel_spec)
      call s:open_file(camel_spec, a:cmd)
    elseif filereadable(snake_test)
      call s:open_file(snake_test, a:cmd)
    elseif filereadable(snake_spec)
      call s:open_file(snake_spec, a:cmd)
    elseif exists('finally_created')
      call s:open_file(finally_created, a:cmd)
    endif
  endif
endfu

" Opens the specified file with its parent directory created.
fu! s:open_file(fname, cmd)
  let parent_dir = fnamemodify(expand(a:fname), ':p:h')
  if !isdirectory(parent_dir)
    call mkdir(parent_dir, 'p')
  endif
  silent exe a:cmd.' '.a:fname
endfu

if has('python')
  com! -nargs=? JavaDoc call s:javadoc(8, <q-args>)
  fu! s:javadoc(version, class)
    let class = ''
    if a:class != ''
      let class = substitute(a:class, '\.', '/', 'g').'.html'
    endif
    let url = 'http://docs.oracle.com/javase/'.a:version.'/docs/api/'.class
    py import webbrowser, vim
    py webbrowser.open(vim.eval("url"), new=2)
  endfu
endif

" ===============================================================
" ABBREVIATIONS {{{1
" ===============================================================

" Insert the current date and time.
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Spelling
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network
abbrev SpaitalNetwork SpatialNetwork
abbrev nwe new

" Shortcut
aug vimrc-abbrev
  au!
  au FileType java call s:abbrev_java()
  au FileType scala call s:abbrev_scala()
aug END

fu! s:abbrev_java()
  iab <buffer> ijm jp.ac.keio.ae.iijima
  iab <buffer> ijmb jp.ac.keio.ae.iijima.besim
  iab <buffer> cvj com.vividsolutions.jts
  iab <buffer> cvjg com.vividsolutions.jts.geom
  iab <buffer> cvja com.vividsolutions.jts.algorithm
  iab <buffer> cvjm com.vividsolutions.jts.math
  iab <buffer> cvjgu com.vividsolutions.jts.geom.util
  iab <buffer> sfn sim.field.network
  iab <buffer> sfg sim.field.grid
  iab <buffer> sfc sim.field.continuous
  iab <buffer> oij openifctools.com.openifcjavatoolbox
  iab <buffer> jvec javax.vecmath
endfu

fu! s:abbrev_scala()
  call s:abbrev_java()
  iab <buffer> jconv scala.collection.JavaConversions._
endfu

" ===============================================================
" PLUGINS {{{1
" ===============================================================

" --------------------------------------------------------------
" Plug {{{2
" --------------------------------------------------------------

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

com! PlugYcm call s:load_ycm()
fu! s:load_ycm()
  call plug#load('YouCompleteMe', 'ultisnips', 'vim-snippets')
  call youcompleteme#Enable()
endfu

" --------------------------------------------------------------
" ColorScheme {{{2
" --------------------------------------------------------------
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \zs[0-9a-f]\{7}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#NetrwBrowseX(url, 0)
endfunction

" --------------------------------------------------------------
" ColorScheme {{{2
" --------------------------------------------------------------
let g:solarized_termcolors = 256
let g:solarized_visibility = 'high'
let g:solarized_hitrail = 0
let g:solarized_termtrans = 0
let g:solarized_italic = 0

set background=dark
silent! colorscheme solarized

" --------------------------------------------------------------
" gist {{{2
" --------------------------------------------------------------
if has('mac')
  let g:gist_clip_command = 'pbcopy'
elseif has('unix')
  let g:gist_clip_command = 'xclip -selection clipboard'
else
  let g:gist_clip_command = 'putclip'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0
let g:gist_show_privates = 1
let g:gist_post_private = 1

" --------------------------------------------------------------
" CtrlP {{{2
" --------------------------------------------------------------
if executable('ag')
  let s:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('pt')
  let s:ctrlp_user_command = 'pt -l --follow --nocolor "" %s'
elseif executable('ack')
  let s:ctrlp_user_command = 'ack --follow --nocolor -g "" %s'
endif
let s:ctrlp_vcs_user_commands = {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ }
if exists('s:ctrlp_user_command')
  let g:ctrlp_user_command = {
    \ 'types': s:ctrlp_vcs_user_commands,
    \ 'fallback': s:ctrlp_user_command
    \ }
else
  let g:ctrlp_user_command = {
    \ 'types': s:ctrlp_vcs_user_commands
    \ }
endif

" default ignored directories
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_mruf_max = 1000

nnoremap <silent> <Leader>p :CtrlP<CR>
" This immitates atom, sublimeText and so on.
nnoremap <silent> <C-p> :CtrlP<cr>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
nnoremap <silent> <Leader>d :CtrlPBookmarkDir<CR>

let s:ctrlp_bookmark_common_paths = [
  \ '~/projects/*',
  \ '~/lib/*',
  \ '~/dotfiles',
  \ '~/gdrive',
  \ '$JAVA_HOME/src',
  \ '$GOROOT/src'
  \ ]

if has('unix')
  let s:ctrlp_bookmark_paths = [
    \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/jvm/java-[1-9]\+-oracle'
    \ ]
endif

if exists('s:ctrlp_bookmark_paths')
  call extend(s:ctrlp_bookmark_paths, s:ctrlp_bookmark_common_paths)
else
  let s:ctrlp_bookmark_paths = s:ctrlp_bookmark_common_paths
endif

com! -bang CtrlPBookmarkReload call s:ctrlp_bookmark_init(<bang>0)
fu! s:ctrlp_bookmark_init(bang)
  if a:bang != 0
    call delete(expand('~/.cache/ctrlp/bkd/cache.txt'))
  endif
  if exists('s:ctrlp_bookmark_paths')
    for path in s:ctrlp_bookmark_paths
      let dirs = split(expand(path), '\n')
      let dirs = map(dirs, 'resolve(v:val)')
      call s:ctrlp_bookmark_add(dirs)
    endfor
  endif
  call s:ctrlp_bookmark_add(split(&rtp, ','))
endf

fu! s:ctrlp_bookmark_add(dirs)
  for dir in a:dirs
    if isdirectory(dir)
      silent exe 'CtrlPBookmarkDirAdd! '.dir
    endif
  endfor
endfu

augroup vimrc-ctrlp
  au!
  au VimEnter * if exists(':CtrlPBookmarkDirAdd') | call s:ctrlp_bookmark_init(0) | endif
augroup END

if has('unix') || has('mac') || has('macunix')
  let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
elseif has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" --------------------------------------------------------------
" YCM {{{2
" --------------------------------------------------------------
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_detailed_diagnostics = ''
nnoremap gd :YcmCompleter GoToDeclaration<cr>

" --------------------------------------------------------------
" Ultisnips {{{2
" --------------------------------------------------------------
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" --------------------------------------------------------------
" gitgutter {{{2
" --------------------------------------------------------------
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '~'
" let g:gitgutter_sign_removed = '-'
" nnoremap <leader>gG :GitGutterToggle<cr>

" --------------------------------------------------------------
" signify {{{2
" --------------------------------------------------------------
let g:signify_sign_add = '+'
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'

" --------------------------------------------------------------
" fugitive {{{2
" --------------------------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>5j
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <leader>gD :Gsplit! diff<cr>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <leader>gR :Gremove<cr>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gL :Gsplit! log -n 100<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gA :Git add --all<cr>

" --------------------------------------------------------------
" repeat {{{2
" --------------------------------------------------------------
sil! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" airline {{{2
" --------------------------------------------------------------
" let g:airline_theme = 'understated'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

" --------------------------------------------------------------
" lightline {{{2
" --------------------------------------------------------------
let g:lightline = {}

let g:lightline.colorscheme = 'solarized'

let g:lightline.active = {}
let g:lightline.active.left = [
  \   ['mode', 'paste'],
  \   ['signify', 'fugitive'],
  \   ['pwd', 'filename']
  \ ]
let g:lightline.active.right = [
  \   ['lineinfo', 'syntastic'],
  \   ['percent'],
  \   ['fileformat', 'fileencoding', 'filetype']
  \ ]

let g:lightline.component_function = {}
let g:lightline.component_function.syntastic = 'SyntasticStatuslineFlag'
" let g:lightline.component_function.gitgutter = 'MyGitGutter'
let g:lightline.component_function.signify = 'MySignify'
let g:lightline.component_function.filename = 'MyFilename'
let g:lightline.component_function.pwd = 'MyPWD'
let g:lightline.component_function.fugitive = 'MyFugitive'

" let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

let g:lightline.tabline = {}
let g:lightline.tabline.left = [ [ 'tabs' ] ]
let g:lightline.tabline.right = [ [ 'close' ] ]

let g:lightline.tab = {}
let g:lightline.tab.active = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tab.inactive = [ 'tabnum', 'filename', 'modified' ]

let g:lightline.component_expand = {}
let g:lightline.component_expand.tabs = 'lightline#tabs'

let g:lightline.component_type = {}
let g:lightline.component_type.tabs = 'tabsel'
let g:lightline.component_type.close = 'raw'

let g:lightline.tab_component_function = {}
let g:lightline.tab_component_function.filename = 'lightline#tab#filename'
let g:lightline.tab_component_function.modified = 'lightline#tab#modified'
let g:lightline.tab_component_function.readonly = 'lightline#tab#readonly'
let g:lightline.tab_component_function.tabnum = 'lightline#tab#tabnum'

let g:lightline.enable = {}
let g:lightline.enable.statusline = 1
let g:lightline.enable.tabline = 1

let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
function! CtrlPEnter()
  let w:lightline = 0
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

fu! MyPWD()
  if winwidth('.') <= 90
    return ''
  else
    return substitute(getcwd(), '^'.expand('~'), '~', '')
  endif
endfu

function! MyReadonly()
  return &readonly ? '' : ''
endfunction

function! MyModified()
  return &modifiable && &modified ? '+' : ''
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

fu! MySignify()
  if !exists('*sy#repo#get_stats')
      \ || !(exists('b:sy.active') && b:sy.active)
      \ || winwidth('.') <= 90
    return ''
  endif
  let hunks = sy#repo#get_stats()
  if hunks[0] == -1 || hunks[1] == -1 || hunks[2] == -1
    return ''
  endif
  let symbols = [
    \ get(g:, 'signify_sign_add', '+').' ',
    \ get(g:, 'signify_sign_change', '~').' ',
    \ get(g:, 'signify_sign_delete', '-').' '
    \ ]
  let ret = []
  for i in [0, 1, 2]
    call add(ret, symbols[i].hunks[i])
  endfor
  return join(ret, ' ')
endfu

" --------------------------------------------------------------
" delimitMate {{{2
" --------------------------------------------------------------
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 0
aug vimrc-delimitMate
  au!
  au FileType mkd let b:delimitMate_expand_space = 0
aug END

" --------------------------------------------------------------
" scala {{{2
" --------------------------------------------------------------
aug vimrc-scala
  au!
  au FileType java,scala nnoremap <silent><buffer> <Leader>si :SortScalaImports<CR>
aug END
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" syntastic {{{2
" --------------------------------------------------------------
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ['ruby', 'python'],
  \ "passive_filetypes": []
  \ }
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1

if executable('rubocop')
  let g:syntastic_ruby_checkers = ['rubocop']
endif
if executable('flake8')
  let g:syntastic_python_checkers = ['flake8']
endif

" --------------------------------------------------------------
" tagbar {{{2
" --------------------------------------------------------------
" if v:version >= 703
"   nnoremap <silent> <leader>t :TagbarToggle<cr>
"   let g:tagbar_sort = 0
"   let g:tagbar_show_linenumbers = 2
"   let g:tagbar_autofocus = 1
"   let g:tagbar_autoclose = 1
" endif

" --------------------------------------------------------------
" nerdtree {{{2
" --------------------------------------------------------------
" If you get the error like 'Undefined variable b:NERDTree',
" you should run the command like ':NERDTree .'.
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>
nnoremap <leader>nx :NERDTreeClose<cr>
nnoremap <leader>nb :NERDTreeFromBookmark
let g:NERDTreeShowHidden = 1

augroup vimrc-nerdtree
  autocmd!
  autocmd FileType nerdtree com! -buffer NERDTreePromote call s:nerdtree_promote()
  autocmd FileType nerdtree com! -buffer NERDTreeDemote call s:nerdtree_demote()
  autocmd FileType nerdtree nnoremap <silent> <buffer> << :NERDTreePromote<cr>
  autocmd Filetype nerdtree nnoremap <silent> <buffer> >> :NERDTreeDemote<cr>
augroup END

fu! s:nerdtree_promote()
  let curNode = g:NERDTreeFileNode.GetSelected()
  let newNodeDir = fnamemodify(curNode.path.str(), ':h:h')
  let newNodeName = fnamemodify(curNode.path.str(), ':t')
  let newNodePath = ''
  if has('win32') || ('win64')
    let newNodePath = join([newNodeDir, newNodeName], '\')
  else
    let newNodePath = join([newNodeDir, newNodeName], '/')
  endif
  try
    call curNode.rename(newNodePath)
    call NERDTreeRender()
    call curNode.putCursorHere(1, 0)
    redraw
  catch /^NERDTree/
    echoe 'Node Not Promoted'
  endtry
endfu

fu! s:nerdtree_demote()
  let curNode = g:NERDTreeFileNode.GetSelected()
  let newNodeDir = fnamemodify(curNode.path.str(), ':h')
  let newNodeDest = input('New Directory? ')
  let newNodeName = fnamemodify(curNode.path.str(), ':t')
  if has('win32') || ('win64')
    let newNodePath = join([newNodeDir, newNodeDest, newNodeName], '\')
  else
    let newNodePath = join([newNodeDir, newNodeDest, newNodeName], '/')
  endif
  try
    call curNode.rename(newNodePath)
    call NERDTreeRender()
    call curNode.putCursorHere(1, 0)
    redraw
  catch /^NERDTree/
    echoe 'Node Not Promoted'
  endtry
endfu

" --------------------------------------------------------------
" indentLine {{{2
" --------------------------------------------------------------
let g:indentLine_color_term = 242

" --------------------------------------------------------------
" markdown {{{2
" --------------------------------------------------------------
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1

" --------------------------------------------------------------
" instant-markdown {{{2
" --------------------------------------------------------------
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0

" --------------------------------------------------------------
" undotree {{{2
" --------------------------------------------------------------
let g:undotree_SetFocusWhenToggle = 1
nnoremap <leader>u :UndotreeToggle<cr>

" --------------------------------------------------------------
" calendar {{{2
" --------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" --------------------------------------------------------------
" auto-save {{{2
" --------------------------------------------------------------
" let g:auto_save = 1
" let g:auto_save_no_update_time = 1
" let g:auto_save_in_insert_mode = 0

" --------------------------------------------------------------
" unite {{{2
" --------------------------------------------------------------
" if executable('ag')
"   let g:unite_source_rec_async_command =
"     \ 'ag --follow --nocolor --nogroup -g ""'
"   let g:unite_source_grep_command = 'ag'
" elseif executable('ack')
"   let g:unite_source_rec_async_command =
"     \ 'ack --follow --nocolor --nogroup -g ""'
"   let g:unite_source_grep_command = 'ack'
" endif

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <silent> <leader>pp :Unite -start-insert file_rec<cr>
" nnoremap <silent> <leader>pb :Unite -start-insert buffer<cr>
" nnoremap <silent> <leader>pd :Unite -start-insert directory_rec/async<cr>
" nnoremap <silent> <leader>pv :Unite -start-insert -path='~/.vim' file_rec<cr>

" --------------------------------------------------------------
" neosnippet {{{2
" --------------------------------------------------------------
" map <c-k> <Plug>(neosnippet_expand_or_jump)
" smap <c-k> <Plug>(neosnippet_expand_or_jump)
" xmap <c-k> <Plug>(neosnippet_expand_target)
" let g:neosnippet#snippets_directory = '~/.vim/bundle/neosnippet-snippets/neosnippets'
" imap <expr><tab> neosnippet#expandable_or_jumpable() ?
"             \ "\<Plug>(neosnippet_expand_or_jump)"
"             \: pumvisible() ? "\<c-n>" : "\<tab>"
" smap <expr><tab> neosnippet#expandable_or_jumpable() ?
"             \ "\<Plug>(neosnippet_expand_or_jump)"
"             \: "\<tab>"

" --------------------------------------------------------------
" neocomplete {{{2
" --------------------------------------------------------------
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_delimiter = 0
" let g:neocomplete#sources#syntax#min_keyword_length = 4
" let g:neocomplete#auto_completion_start_length = 2
" if !exists('g:neocomplete#sources')
"     let g:neocomplete#sources = {}
" endif
" let g:neocomplete#sources._ = ['buffer', 'neosnippet']
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Some pane configuration

" --------------------------------------------------------------
" vimux {{{2
" --------------------------------------------------------------
" let g:VimuxHeight = "40"
" let g:VimuxOrientation = "v"
" " let g:VimuxRunnerType = "window"
" " let g:VimuxUseNearest = 0

" nnoremap <silent> <Leader>vp :wa<CR>:call <sid>VimuxPromptCommand()<CR>
" nnoremap <silent> <Leader>vl :wa<CR>:call <sid>VimuxRunLastCommand()<CR>
" nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
" nnoremap <silent> <Leader>vq :call <sid>VimuxCloseRunner()<CR>
" nnoremap <silent> <Leader>vs :VimuxInterruptRunner<CR>
" nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>
" nnoremap <silent> <Leader>vo :call <sid>VimuxOpenRunnerAtCWD()<CR>
" nnoremap <silent> <leader>vu :VimuxScrollUpInspect<cr>
" nnoremap <silent> <leader>vd :VimuxScrollDownInspect<cr>

" function! s:VimuxOpenRunnerAtCWD()
"   let cmd = "cd " . getcwd()
"   sil call s:VimuxRunCommand(cmd)
" endfunction

" " aliases for build
" nnoremap <silent> <Leader>vc :wa<CR>:call <sid>VimuxCompile()<CR>
" nnoremap <silent> <leader>vC :wa<cr>:call <sid>VimuxCompileAll()<cr>
" nnoremap <silent> <Leader>vr :wa<CR>:call <sid>VimuxRun()<CR>
" nnoremap <silent> <leader>vR :wa<cr>:call <sid>VimuxRunAll()<cr>
" nnoremap <silent> <Leader>vt :wa<cr>:call <sid>VimuxTest()<CR>
" nnoremap <silent> <leader>vT :wa<cr>:call <sid>VimuxTestAll()<cr>
" nnoremap <silent> <leader>vI :wa<cr>:call <sid>VimuxInteractiveMode()<cr>
" nnoremap <silent> <leader>vL :wa<cr>:call <sid>VimuxReload()<cr>
" nnoremap <silent> <leader>vP :call <sid>VimuxRepl()<cr>
" nnoremap <silent> <Enter> :call <sid>VimuxToggleRunner()<cr>

" fu! s:IsTest(fname)
"   if a:fname =~ '\(Test\|Spec\|_test\|_spec\)'
"     return 1
"   else
"     return 0
"   endif
" endfu

" fu! s:VimuxInteractiveMode()
"   call s:VimuxOpenRunnerAtCWD()
"   call s:VimuxRunCommand("sbt")
" endfu

" fu! s:VimuxReload()
"   call s:VimuxRunCommand("reload")
" endfu

" fu! s:VimuxRepl()
"   sil call s:VimuxRunCommand("consoleQuick")
"   sil call s:VimuxSelectPane()
" endfu

" fu! s:VimuxToggleRunner()
"   sil exe "!tmux resize-pane -Z"
" endfu

" fu! s:VimuxCompile()
"   sil call s:VimuxRunCommand("compile")
" endfu

" fu! s:VimuxCompileAll()
"   sil call s:VimuxRunCommand("test:compile")
" endfu

" function! s:VimuxTest()
"   let l:fname = expand("%:t:r")
"   if s:IsTest(l:fname)
"     let s:last_test = l:fname
"     let l:command = "test:testOnly *" . l:fname
"   elseif exists("s:last_test")
"     let l:command = "test:testOnly *" . s:last_test
"   else
"     echoe "The last test is not found."
"     return ''
"   endif
"   sil call s:VimuxRunCommand(l:command)
" endfunction

" function! s:VimuxTestAll()
"   sil call s:VimuxRunCommand("testQuick")
" endfunction

" fu! s:VimuxRun()
"   let fpath = expand('%:p:r')
"   let fname = substitute(fpath, '.*/src/main/\(java\|scala\)/\(.*\)', '\2', '')
"   let proj_name = substitute(fpath, '.*/\([^/]*\)/src/main/.*', '\1', '')
"   let package = substitute(fname, '/', '\.', 'g')
"   sil call s:VimuxRunCommand(proj_name . "/runMain " . package)
" endfu

" fu! s:VimuxRunAll()
"   sil call s:VimuxRunCommand("run")
" endfu

" " Almost same as g:VimuxRunCommand function, but resize panes at first.
" fu! s:VimuxRunCommand(cmd)
"   if _VimuxRunnerType() == "pane"
"     sil exe "!tmux resizep"
"   endif
"   sil exe "call VimuxRunCommand(\"" . a:cmd . "\")"
"   sil exe "redraw!"
" endfu

" " Almost same as g:VimuxPromptCommand function, but use s:VimuxRunCommand
" " function
" fu! s:VimuxPromptCommand(...)
"   let command = a:0 == 1 ? a:1 : ""
"   let l:command = input(_VimuxOption("g:VimuxPromptString", "Command? "), command)
"   call s:VimuxRunCommand(l:command)
" endfu

" fu! s:VimuxRunLastCommand()
"   if exists("g:VimuxRunnerIndex")
"     call s:VimuxRunCommand(g:VimuxLastCommand)
"   else
"     echo "No last vimux command."
"   endif
" endfu

" fu! s:VimuxCloseRunner()
"   call VimuxCloseRunner()
"   exe "redraw!"
" endfu

" fu! s:VimuxSelectPane()
"   let index = _VimuxNearestIndex()
"   let type = _VimuxRunnerType()
"   let result = system("tmux select-" . type . " -t " . index)
" endfu
