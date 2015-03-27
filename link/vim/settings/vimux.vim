" Some pane configuration
" let g:VimuxHeight = "45"
" let g:VimuxOrientation = "h"

nnoremap <silent> <Leader>vp :wa<CR>:VimuxPromptCommand<CR>
nnoremap <silent> <Leader>vl :wa<CR>:VimuxRunLastCommand<CR>
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
nnoremap <silent> <Leader>vq :VimuxCloseRunner<CR>
nnoremap <silent> <Leader>vs :VimuxInterruptRunner<CR>
nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>
nnoremap <silent> <Leader>vo :call VimuxOpenRunnerAtCWD()<CR>

function! VimuxOpenRunnerAtCWD()
  let cwd = getcwd()
  exe "normal! :VimuxRunCommand(\"" . cwd . "\")\<CR>"
endfunction

" aliases for build
nnoremap <silent> <Leader>vc :wa<CR>:VimuxRunCommand("compile")<CR>
nnoremap <silent> <leader>vC :wa<cr>:VimuxRunCommand("test:compile")<cr>
nnoremap <silent> <Leader>vr :wa<CR>:call VimuxRunSingle()<CR>
nnoremap <silent> <leader>vR :wa<cr>:call VimuxRunAll()<cr>
nnoremap <silent> <Leader>vt :wa<cr>:call VimuxTestSingle()<CR>
nnoremap <silent> <leader>vT :wa<cr>:call VimuxTestAll()<cr>

let s:last_test = ""

function! VimuxTestSingle()
  exe "normal! :wa\<CR>"
  let l:name = expand("%:t:r")
  let l:command = ""
  if l:name =~# "\.\*Test"
    let s:last_test = l:name
    let l:command = "test:testOnly *" . l:name
  else
    let l:command = "test:testOnly *" . s:last_test
  endif
  exe "normal! :call VimuxRunCommand(\"" . l:command . "\")\<CR>"
endfunction

function! VimuxTestAll()
  exe "normal! :wa\<cr>"
  if &filetype == "scala"
    l:command = "test"
  else
    echoe "Test command is not defined."
  endif
  exe "normal! :call VimuxRunCommand(\"" . l:command . "\")\<cr>"
endfunction

fu! VimuxRunSingle()
  let l:fname = substitute(expand("%:p:r"), '.*/src/main/\(java\|scala\)/\(.*\)', '\2', '')
  let l:main = substitute(l:fname, '/', '\.', 'g')
  exe "norm! :call VimuxRunCommand(\"runMain ".l:main."\")\<cr>"
endfu

fu! VimuxRunAll()
  if $filetype == "scala"
    exe "call VimuxRunCommand(\"run\")"
  else
    echoe "Run command is not defined."
  endif
endfu
