scripte utf-8
source ~/.config/nvim/_plug.vim
source ~/.config/nvim/_qt.vim
source ~/.config/nvim/_plug_config.vim
source ~/.config/nvim/config.vim
" 各种set {{{
" 外观 {{{
" 语法高亮
syntax on
" 显示行号
" set number
" 相对行号
" set relativenumber
" 启动的时候不显示那个援助索马里儿童的提示
" set shortmess=atI
" 在被分割的窗口间显示空白，便于阅读
" set fillchars=vert:\ ,stl:\ ,stlnc:\
" 命令行（在状态行下）的高度，默认为1，这里是2
" set cmdheight=2
" 总是显示状态行
" set laststatus=2
" 我的状态行显示的内容（包括文件类型和解码）
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" 高亮当前行  
set cursorline
" 高亮当前列
" set cursorcolumn
" }}}
" 编辑 {{{
" Leader设置
if !exists('g:k_nv_leader')
	let mapleader = ' '
else
	let mapleader = g:k_nv_leader
endif
" 缩进 {{{
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set smarttab
" 不要用空格代替制表符
set noexpandtab
" 自动缩进
set autoindent
" 在行和段开始处使用制表符
set shiftwidth=4
" 为C程序提供自动缩进
set cindent
set smartindent
" }}}
" 自动换行
" set wrap
" 整词换行
" set linebreak
"行内替换
" set gdefault
" 插入括号时跳转
" set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
" set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
" set scrolloff=3
" 波浪符命令 ~ 的行为类似于操作符。
" set tildeop
" ctrl-a和ctrl-x
" set nrformats=alpha,hex
" }}}
" 内部 {{{
" 去掉输入错误的提示声音
set noerrorbells " noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 历史记录数
set history=1000
" 文件备份
set nobackup
"禁止生成临时文件
set noswapfile
"搜索逐字符高亮
set hlsearch
set incsearch
" }}}
"语言 {{{
"编码设置
" set encoding=utf-8 " enc
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set helplang=cn
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" }}}
"其他 {{{
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 在编辑过程中，在右下角显示光标位置的状态行
" set ruler          
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
" 字符间插入的像素行数目
" set linespace=0
" 增强模式中的命令行自动完成操作,命令行自动补全
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
" set backspace=2
" 允许backspace和光标键跨越行边界
" set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" set mouse=a
" 可视模式的行为
set selection=inclusive " 默认
" }}}
" }}}
" color {{{
syntax enable
let g:solarized_termcolors=256
set background=dark
"set background=light
colorscheme solarized
" colorscheme torte
" colorscheme murphy
" }}}
" 开关折叠 {{{
set foldenable
" set foldmethod=manual " 手动折叠 
set foldmethod=marker " 按标记折叠
" set foldmethod=syntax " 按语法高亮来折叠
" set foldmethod=indent " 更多的缩进表示更高级别的折叠(这个似乎效果好一些)
" 用<CR>自动折叠,其实就是za
" nnoremap <silent> <CR> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 打开/关闭所有折叠
nnoremap <silent> zo zR
nnoremap <silent> zc zM
" }}}
" 各种map {{{
" 窗口操作 {{{
" practice
nnoremap <Leader>w <Cmd>up<CR>
nnoremap <C-w> <Cmd>echo 'fuck'<CR>
nnoremap <Tab> <C-w>
nnoremap <Tab><Tab> <Tab>
nnoremap <Leader>bo <Cmd>botright copen 8 <CR>
nnoremap <Leader>e <Cmd>edit<CR>
" }}}
" Terminal {{{
nnoremap <Leader>ba <Cmd>terminal<CR>:set nonu<CR>a
tnoremap <C-\> <C-\><C-n>
nnoremap <Leader>ca <Cmd>ConqueTerm bash<CR>
tnoremap <C-h> <BS>
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
nnoremap : q:a
" }}}
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
