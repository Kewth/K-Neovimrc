let g:w_vim_s_lv = 1
let g:w_vim_title = '使用hjkl在普通模式移动'
nnoremap h :echo 'Left'<CR>h
nnoremap j :echo 'Down'<CR>j
nnoremap k :echo 'Up'<CR>k
nnoremap l :echo 'Right'<CR>l
inoremap <Up> a<BS>
inoremap <Left> a<BS>
inoremap <Right> a<BS>
inoremap <Down> a<BS>
noremap <Up> jk
noremap <Left> jk
noremap <Right> jk
noremap <Down> jk
