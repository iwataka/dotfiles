if !executable('pandoc') || (exists('g:mini_markdown_loaded') && g:mini_markdown_loaded)
  finish
endif

if !exists('g:mini_markdown_sleep_time')
  let g:mini_markdown_sleep_time = 1
endif

if !exists('g:mini_markdown_tmp_dir')
  let g:mini_markdown_tmp_dir = '/tmp/'
endif

if has('unix')
  let s:open_cmd = 'xdg-open'
elsei has('win32unix')
  let s:open_cmd = 'cygstart'
elsei has('win32') || has('win64')
  let s:open_cmd = 'start'
elsei has('mac')
  let s:open_cmd = 'open'
endif

fu! mini_markdown#preview(src)
  if has('python')
    call s:preview_python(a:src)
  elseif has('ruby')
    call s:preview_ruby(a:src)
  else
    echom 'Mini-markdown requires ruby or python interface.'
  endif
endfu

function! s:preview_ruby(src)
ruby << EOF
require 'tempfile'
tmp_dir = VIM::evaluate('g:mini_markdown_tmp_dir')
file = Tempfile.new(['output', '.html'], tmp_dir)
begin
  src = VIM::evaluate('a:src')
  path = file.path
  open_cmd = VIM::evaluate('s:open_cmd')
  system("pandoc #{src} -o #{path}")
  system("#{open_cmd} #{path}")
  VIM.command('redraw!')
  sleep_time = VIM::evaluate('g:mini_markdown_sleep_time')
  sleep(sleep_time)
ensure
  file.close
  file.unlink
end
EOF
endfunction

fu! s:preview_python(src)
py << EOF
import tempfile
import time
from subprocess import call
tmp_dir = vim.eval('g:mini_markdown_tmp_dir')
file = tempfile.NamedTemporaryFile(suffix = '.html', dir = tmp_dir)
try:
  src = vim.eval('a:src')
  path = file.name
  open_cmd = vim.eval('s:open_cmd')
  call(["pandoc", src, "-o", path])
  call([open_cmd, path])
  vim.command('redraw!')
  sleep_time = vim.eval('g:mini_markdown_sleep_time')
  time.sleep(float(sleep_time))
finally:
  file.close()
EOF
endfu

fu! mini_markdown#preview_current_buffer()
  let l:current_buf = expand("%:p")
  call mini_markdown#preview(l:current_buf)
endfu
