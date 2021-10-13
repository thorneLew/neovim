"快速选行
noremap J 7j
noremap K 7k

vnoremap Y "+y 


function! s:switchEditor(...) abort
    let count = a:1
    let direction = a:2
    for i in range(1, count ? count : 1)
        call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
    endfor
endfunction

xmap gc   <Plug> VSCodeCommentary
nmap gc   <Plug> VSCodeCommentary
omap gc   <Plug> VSCodeCommentary
nmap gcc  <Plug> VSCodeCommentaryLine

nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nnoremap <tab> <Cmd>call <SID>switchEditor(v:count, 'next')<CR>


" 视图调整
function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

" Sample keybindings. Note these override default keybindings mentioned above.
nnoremap <C-w>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <C-w>> <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <C-w>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
xnoremap <C-w>+ <Cmd>call <SID>manageEditorSize(v:count, 'increase')<CR>
nnoremap <C-w>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <C-w>< <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
nnoremap <C-w>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>
xnoremap <C-w>- <Cmd>call <SID>manageEditorSize(v:count, 'decrease')<CR>

"tab切换
nnoremap <C-l> <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
xnoremap <C-l> <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
nnoremap <C-h> <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
xnoremap <C-h><Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
