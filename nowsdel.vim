" vi:set ts=8 sts=2 sw=2 tw=0:
scriptencoding utf-8

" nowsdel.vim - set nowrapscan while search(/?) motion used in d{motion}
"
" Maintainer: KIHARA Hideto <deton@m1.interq.or.jp>
" Last Change: 2020-02-02

if exists('g:loaded_nowsdel')
  finish
endif
let g:loaded_noswdel = 1

augroup nowsdel
  autocmd!
  au CmdlineEnter * call <SID>OnCmdlineEnter(expand("<afile>"))
augroup END

function! s:OnCmdlineEnter(type)
  if a:type != '/' && a:type != '?'
    return
  endif
  let op = v:operator
  " reset v:operator
  exe "normal! g?\<ESC>"
  if op != '' && op != 'g?'
    set nows
  else
    set ws
  endif
endfunction

function! s:setws(cmd)
  set ws
  return a:cmd
endfunction

function! s:cmd_or_maparg(cmd)
  if maparg(a:cmd, 'n') != ''
    return ''
  endif
  return a:cmd
endfunction

function! s:mapplug()
  execute 'nnoremap <expr> <Plug>(nowsdel-n) <SID>setws("' . s:cmd_or_maparg('n') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-N) <SID>setws("' . s:cmd_or_maparg('N') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-*) <SID>setws("' . s:cmd_or_maparg('*') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-g*) <SID>setws("' . s:cmd_or_maparg('g*') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-#) <SID>setws("' . s:cmd_or_maparg('#') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-g#) <SID>setws("' . s:cmd_or_maparg('g#') . '")'
"  nnoremap <script> <silent> <Plug>(nowsdel-n) :<C-U>se ws<CR>:exe "normal! " . v:count . "n"<CR>
"  nnoremap <script> <silent> <Plug>(nowsdel-N) :<C-U>se ws<CR>:exe "normal! " . v:count . "N"<CR>
"  nnoremap <script> <silent> <Plug>(nowsdel-*) :<C-U>se ws<CR>:exe "normal! " . v:count . "*"<CR>
"  nnoremap <script> <silent> <Plug>(nowsdel-g*) :<C-U>se ws<CR>:exe "normal! " . v:count . "g*"<CR>
"  nnoremap <script> <silent> <Plug>(nowsdel-#) :<C-U>se ws<CR>:exe "normal! " . v:count . "#"<CR>
"  nnoremap <script> <silent> <Plug>(nowsdel-g#) :<C-U>se ws<CR>:exe "normal! " . v:count . "g#"<CR>
endfunction

call s:mapplug()
if !get(g:, 'nowsdel_no_default_key_mappings', 0)
  execute 'nmap n <Plug>(nowsdel-n)'   . maparg('n', 'n')
  execute 'nmap N <Plug>(nowsdel-N)'   . maparg('N', 'n')
  execute 'nmap * <Plug>(nowsdel-*)'   . maparg('*', 'n')
  execute 'nmap g* <Plug>(nowsdel-g*)' . maparg('g*', 'n')
  execute 'nmap # <Plug>(nowsdel-#)'   . maparg('#', 'n')
  execute 'nmap g# <Plug>(nowsdel-g#)' . maparg('g#', 'n')
endif
