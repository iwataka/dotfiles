let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitgutter', 'fugitive'],
  \     ['filename', 'modified', 'readonly']
  \   ],
  \   'right': [
  \     ['lineinfo', 'syntastic'],
  \     ['percent'],
  \     ['charcode', 'fileformat', 'fileencoding', 'filetype']
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
  if winwidth(0) > 60 && exists('*fugitive#statusline')
    retu fugitive#statusline()
  else
    retu ''
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
