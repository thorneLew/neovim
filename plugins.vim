
"兼容设置
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"设置鼠标
set mouse=a
set encoding=utf-8

" set tabnumber
set tabstop=4
set shiftwidth=4
set scrolloff=5
set expandtab
set autoindent



"兼容编辑器颜色
let &t_ut=''
		
" 开启语法高亮
syntax on
"设置行号
set number
set norelativenumber
"光标下划线
set cursorline
"超长行，会自动换行
set wrap
"显示输入的命令
set showcmd
"显示原始菜单eg: color <tab>键
set wildmenu

"高亮搜索文案
set hlsearch
"定义取消高亮搜索文案
exec "nohlsearch"
"搜索立即高亮
set incsearch
"忽略大小写
set ignorecase
"自动大小写识别
set smartcase

"使用plugged来管理插件
call plug#begin('$HOME/.config/nvim/plugged')
"添加目录树：nerdtree"
Plug 'scrooloose/nerdtree'
"语法检查和语义错误
Plug 'dense-analysis/ale'
"快速注释
Plug 'tpope/vim-commentary'

" 皮肤主题
Plug 'morhetz/gruvbox'
"coc语言补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"快速添加'|"|<|{ 等 
Plug 'tpope/vim-surround'
"快速剪切版查找插件
Plug 'junegunn/vim-peekaboo'
"快速选中
Plug 'mg979/vim-visual-multi'
"快速选中块 
Plug 'gcmt/wildfire.vim'
"快速搜索文件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"快速查找
Plug 'easymotion/vim-easymotion'
"状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim 终端
Plug 'voldikss/vim-floaterm'
"补全成对的括号
Plug 'jiangmiao/auto-pairs'
" 断点工具
" Plug 'puremourning/vimspector'

call plug#end()


"键位冲突修改 使用 <Leader> + s 触发
map <Leader> <Plug>(easymotion-prefix)

" fzf plugin
nnoremap <silent> <LEADER>f :Files<CR>

" debuger
" packadd! vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


"floaterm config
let  g:floaterm_keymap_new     =  '<F7>'
let  g:floaterm_keymap_prev    =  '<F8>'
let  g:floaterm_keymap_next    =  '<F9>'
let  g:floaterm_keymap_toggle  =  '<F12>'


"gruvbox - start
let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
color gruvbox
set background=dark
"gruvbox - end

"airline
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled = 1
" let g:airline_powerline_fonts = 1
map <C-t> :tabnew
nnoremap <tab> :bn<CR>
nnoremap <LEADER>c  :bdelete<CR>

"nerdtree config
map <LEADER>t :NERDTreeToggle<CR> 
" current files menu
map tn :exec('NERDTree '.expand('%:h'))<CR>

"coc.nvim -- start
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-eslint', 'coc-prettier', 'coc-git', 'coc-html', 'coc-css', 'coc-go', 'coc-browser', 'coc-yank', 'coc-highlight', 'coc-vetur']
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion. not use 
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

"format codeFile
vmap <C-f> <Plug>(coc-format-selected)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<Cr>
