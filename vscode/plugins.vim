
call plug#begin('$HOME/.config/nvim/plugged')
    "突出特殊字符
    Plug 'unblevable/quick-scope'
    Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
call plug#end()

map <Leader> <Plug>(easymotion-prefix)

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifgc'#5fffff' gui=underline ctermfg=81 cterm=underline
