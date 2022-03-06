scripte utf-8
source ~/.config/nvim/config.vim
if !exists('g:k_nv_leader')
	let mapleader = ' '
else
	let mapleader = g:k_nv_leader
endif
source ~/.config/nvim/_plug.vim
source ~/.config/nvim/_qt.vim
source ~/.config/nvim/_plug_config.vim
" 各种set {{{
" 外观 {{{
" 语法高亮
syntax on
" 显示行号
" set number
" 相对行号
" set relativenumber
" 高亮当前行
set cursorline
" 高亮当前列
" set cursorcolumn
" }}}
" 缩进 {{{
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
" 自动缩进
set autoindent
" 在行和段开始处使用制表符
set shiftwidth=4
" 为C程序提供自动缩进
set cindent
set smartindent
" }}}
" 内部 {{{
" 去掉输入错误的提示声音
set noerrorbells
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 文件备份（备份的是写入前的文件）
set nobackup
"禁止生成临时文件
set noswapfile
"搜索逐字符高亮
set hlsearch
set incsearch
" }}}
"语言 {{{
"编码设置
" set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set helplang=cn
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" }}}
" 窗口 {{{
" 关闭窗口后不重新调整窗口
set noea
" }}}
"其他 {{{
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 增强模式中的命令行自动完成操作,命令行自动补全
set wildmenu
" }}}
" }}}
" color {{{
syntax enable
let g:solarized_termcolors=256
if exists('g:k_nv_light')
	set background=light
else
	set background=dark
endif
colorscheme solarized
" }}}
" 开关折叠 {{{
set foldenable
" set foldmethod=manual " 手动折叠
set foldmethod=marker " 按标记折叠
" set foldmethod=syntax " 按语法高亮来折叠
" set foldmethod=indent " 更多的缩进表示更高级别的折叠(这个似乎效果好一些)
" 打开/关闭所有折叠
" }}}
" 各种map {{{
" 窗口操作 {{{
" practice
nnoremap <Leader>w <Cmd>up<CR>
nnoremap <Leader><Space>w <Cmd>w<CR>
nnoremap <Tab> <C-w>
nnoremap <Tab>q <C-w>q
nnoremap <Tab><Tab> <Tab>
nnoremap <Leader>bo <Cmd>botright copen 8 <CR>
nnoremap <Leader>e <Cmd>edit<CR>
" }}}
" Terminal {{{
" nnoremap <Leader>ba <Cmd>terminal<CR>:set nonu<CR>a
nnoremap <Leader>ba <Cmd>e term://zsh<CR>:set nonu<CR>a
tnoremap <C-\> <C-\><C-n>
tnoremap <C-q> <C-\><C-n><C-w>
nnoremap <Leader>ca <Cmd>ConqueTerm bash<CR>
tnoremap <C-h> <BS>
nnoremap <Leader>xsh <Cmd>e term://zsh<CR>:set nonu<CR>:call XSHinit()<CR>axsh<CR>
function XSHinit()
	" tnoremap <buffer> <a-h> <C-b>
	" tnoremap <buffer> <a-l> <C-f>
	" tnoremap <buffer> <a-j> <C-n>
	" tnoremap <buffer> <a-k> <C-p>
endfunction
" }}}
" 分页操作 {{{
nnoremap <Leader><Tab><Tab> <Cmd>tabnew<CR>
nnoremap <Leader><Tab>] <Cmd>tabmove +1<CR>
nnoremap <Leader><Tab>[ <Cmd>tabmove -1<CR>
" }}}
" 光标移动 {{{
" 屏幕行移动
noremap <C-n> gj
noremap <C-p> gk
" }}}
" 目录设置 {{{
nnoremap <Leader>cd <Cmd>cd %:p:h<CR>
" 自动进入当前目录
cd %:p:h
" }}}
" 命令行 {{{
noremap : :<C-F>a
noremap / /<C-F>a
noremap ? ?<C-F>a
nnoremap <Leader>. :<UP><CR>
" }}}
" 防误触/防机惨 {{{
map <C-z> <Nul>
" nnoremap :w<CR> <Cmd>!i3lock<CR>
" nnoremap :wq<CR> <Cmd>!i3lock<CR>
" nnoremap :w!<CR> <Cmd>!i3lock<CR>
" nnoremap :q<CR> <Cmd>!i3lock<CR>
" }}}
" latex 公式{{{
inoremap <C-L>lim \lim\limits_
inoremap <C-L>eps \varepsilon
inoremap <C-L>al( \begin{aligned}
inoremap <C-L>al) \end{aligned}
inoremap <C-L>cal \mathcal
inoremap <C-L>bb \mathbb
" }}}
" em
nnoremap ` '
nnoremap ' `
" 一键打题模式
nnoremap <Leader>o <Cmd>vs %:r.log<CR><Cmd>sp %:r.out<CR><Cmd>sp %:r.in<CR><C-w>l<C-w>H<C-w>=
nnoremap <Leader>O <Cmd>vs log<CR><Cmd>sp out<CR><Cmd>sp in<CR><C-w>l<C-w>H<C-w>=
" 其他
" :help Y 查看真相，就是不与 Vi 兼容
nnoremap Y y$
" }}}
" " funny print {{{
" function To_buffer() " {{{
" 	let _line = line('.')
" 	if(_line == 9 || _line == 10 || _line == 11)
" 		set modifiable
" 		undo
" 	else
" 		echo 'Unknow place'
" 	endif
" 	if(_line == 10)
" 		LeaderfFileFullScreen
" 	elseif(_line == 11)
" 		NERDTree
" 	elseif(_line == 12)
" 		vs
" 		terminal
" 	elseif(_line == 13)
" 		quit!
" 	endif
" endfunction "}}}
" function To_up() " {{{
" 	if(line('.') > 9)
" 		normal! k
" 	endif
" endfunction " }}}
" function To_down() " {{{
" 	if(line('.') >= 9)
" 		normal! j
" 	endif
" endfunction " }}}
" function Welcome() " {{{
" 	" vs /home/kewth/.config/nvim/welcome
" 	call append(0,'   /##   /##        /####    /#                     /##    /## ##             ')
" 	call append(1,'  | ## / ##        \ #_ ##  | #                    | ##   | # |_/             ')
" 	call append(2,'  \  #| ##         \ # \ ## \  #  /######  /###### | ##   | # /##/######/#### ')
" 	call append(3,'   \ ###/  /#######\ ## \ ## \ # /## __ # / #____ #|  ## / ##| #| ##_  ##_  ##')
" 	call append(4,'   \ #__##\_______/ \ #  \ ##| #| #######| #     \ #\  ## ## | #| ## \ ## \ ##')
" 	call append(5,'   \ #  \ ##        \  #  \  # #| ##     | #     | # \  ###/ | #| ## | ## | ##')
" 	call append(6,'   \ ##  \ ##       \ #   \  ##|  ######\_ #######   \  #/  | #| ## | ## | ##')
" 	call append(7,'   \__/  \__/        \_/    \__/ \______/ \_______/    \_/   |__|__/ |__/ |__/        ─────Kewth')
" 	call append(8,'> To clear this buffer')
" 	call append(9,'> To open LeaderF which is used to serach files')
" 	call append(10,'> To open NerdTree which is used to serach files on a tree')
" 	call append(11,'> To open terminal')
" 	call append(12,'> To exit neovim(or press q)')
" 	call append(13,'Press enter(ctrl-m) at some lines to do something')
" 	set nomodifiable
" 	nnoremap <buffer> <CR> :call To_buffer()<CR>
" 	nnoremap <buffer> q :q!<CR>
" 	nnoremap <buffer> k :call To_up()<CR>
" 	nnoremap <buffer> j :call To_down()<CR>
" endfunction " }}}
" exe 'autocmd VimEnter * : call Welcome()'
" " }}}

" 自动备份
function s:Make_Dir ()
	if strlen (finddir (a:Path)) == 0
		call mkdir (a:Path, "p")
endfunction Make_Dir
function s:To_Backup_File (Backup_Root, File_Path, File_Name)
	let l:Backup_Path = a:Backup_Root . '/' . a:File_Path
	if strlen (finddir (l:Backup_Path)) == 0
		call mkdir (l:Backup_Path, "p")
	endif
	exe 'write!' . l:Backup_Path . '/' . a:File_Name
endfunction Backup_File
autocmd BufWritePre * :call s:To_Backup_File (
	\ '/home/kewth/.vimbackup',
	\ expand('<afile>:p:h'),
	\ expand('<afile>:p:t') )
