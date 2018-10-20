let g:w_vim_s_lv = 0
let g:w_vim_title = '熟悉Vim'
set mouse=a
inoremap <C-s> <Esc>:w<CR>:echo '已保存'<CR>a
inoremap <C-z> <Esc>u:echo '撤销'<CR>a
inoremap <C-y> <Esc>:echo '重做'<CR><C-r>a
vnoremap G G
vnoremap $ $
imap <C-a> <Esc>ggghG$
exe "autocmd InsertLeave * : echo 'press <F1> to get the help'"
