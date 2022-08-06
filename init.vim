
"设置leader键 这里是空格
let mapleader="\<Space>"

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"在 调用 call plug#begin('~/.config/nvim/plugged') 之前 设置plug_url_format即可
" let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'
" let g:plug_url_format='https://git::@github.com.cnpmjs.org/%s.git'

if (!exists('g:vscode'))
    runtime! plugins.vim
    runtime! mappings.vim
else
    runtime! vscode/mappings.vim
    runtime! vscode/plugins.vim
endif
