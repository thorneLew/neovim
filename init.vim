
"设置leader键 这里是空格
let g:mapleader=" "

"在 调用 call plug#begin('~/.config/nvim/plugged') 之前 设置plug_url_format即可
let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'

if (!exists('g:vscode'))
    runtime! plugins.vim
    runtime! mappings.vim
else
    runtime! vscode/mappings.vim
    runtime! vscode/plugins.vim
endif
"coc.nvim --end
