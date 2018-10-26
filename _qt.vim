" 移除菜单栏和工具栏
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" 字体
set guifont=Ubuntu\ Mono\ Italic\ 14
" alt大法 {{{
" 光标移动
cmap <a-j> <Esc>j
cmap <a-k> <Esc>j
imap <a-j> <Esc>j
map <a-j> <Esc>j
imap <a-k> <Esc>k
map <a-k> <Esc>k
imap <a-h> <Esc>h
map <a-h> <Esc>h
imap <a-l> <Esc>l
map <a-l> <Esc>l
imap <a-w> <Esc>w
map <a-w> <Esc>w
imap <a-e> <Esc>e
map <a-e> <Esc>e
imap <a-b> <Esc>b
map <a-b> <Esc>b
imap <a-`> <Esc>``
map <a-`> <Esc>``
" 编辑
inoremap <a-u> a<BS><Esc>u
inoremap <a-y> <Esc>yy
inoremap <a-d> <Esc>dd
inoremap <a-v> <Esc>V
" 插入
imap <a-o> <Esc>o
imap <a-O> <Esc>O
imap <a-c> <Esc>c
nmap <a-c> c
