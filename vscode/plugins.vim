
call plug#begin('$HOME/.config/nvim/plugged')
    "突出特殊字符
    Plug 'unblevable/quick-scope'
    Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
    "快速添加'|"|<|{ 等 
    "eg: cst <
    Plug 'tpope/vim-surround'
    "快速选中块 
    Plug 'gcmt/wildfire.vim'
    Plug 'brglng/vim-im-select'
call plug#end()

map <Leader> <Plug>(easymotion-prefix)

map <Leader>m <Plug>(wildfire-fuel)


highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifgc'#5fffff' gui=underline ctermfg=81 cterm=underline

"vim-im-select 自定切中英问题解决
let g:im_select_get_im_cmd = ['im-select']
let g:im_select_default = 'com.apple.keylayout.ABC'
