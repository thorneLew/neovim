" vim  mappings
"可视模式下，Y复制到系统剪切版
vnoremap Y "+y

" 修改esc键位
inoremap jj <Esc>`^

"lazygit
noremap <C-g> :new<CR>:term lazygit<CR>i

"定义快捷键 sl右分屏 sh左 sj上 sk 下分屏
noremap <LEADER><CR> :nohlsearch<CR>
noremap sl :set splitright<CR>:vsplit<CR> 
noremap sh :set nosplitright<CR>:vsplit<CR> 
noremap sj :set nosplitbelow<CR>:split<CR> 
noremap sk :set splitbelow<CR>:split<CR> 

"定义切换分屏快捷键 lhjk  右左上下
noremap <LEADER>l <C-w>l
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k

"快速选行
noremap J 5j
noremap K 5k

"映射快捷键 s设置空，ctrl + s设置为保存，Q设置为退出，R设置为刷新MYVIMRC
map s <nop>
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-r> :source $MYVIMRC<CR>
