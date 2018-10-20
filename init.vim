scripte utf-8
source ~/.config/nvim/_plug.vim
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
let mapleader = ' '
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
" vim插件 {{{
" YCM {{{
set runtimepath+=~/.vim/plugged/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=['.*\.py$']
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
" let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-n>']  " 映射按键, 没有这个会拦截掉tab 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_show_diagnostics_ui = 1    " 仅对C-family有效
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |           " 回车即选中当前项
nnoremap <C-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=1                 " 从第1个键入字符就开始罗列匹配项
" let g:ycm_global_ycm_extra_conf = '/home/kewth/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " 配置全局路径
let g:ycm_global_ycm_extra_conf = '/home/kewth/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py' " 配置全局路径
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <F4> :YcmDiags<CR>
" inoremap <c-o> <c-x><c-o>
let g:ycm_semantic_triggers = {
\     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
\     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
\     'perl' : ['->', '::', ' '],
\     'php' : ['->', '::', '.'],
\     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
\     'ruby' : ['.', '::'],
\     'lua' : ['.', ':'],
\     'Vim' : ['.'],
\ }
"上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" }}}
" vim-airline {{{
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled = 1 " TAb line
let g:airline_theme='jellybeans'  
if !exists('g:airline_symbols')  
    let g:airline_symbols = {}  
endif  
let g:airline_left_alt_sep = '»'
let g:airline_left_sep = '▶'
" let g:airline_left_sep = '▷'
let g:airline_right_alt_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = '༒ '
" let g:airline_symbols.linenr = '☯'
let g:airline_symbols.maxlinenr = '──㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '⎇Read'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ>'
let g:airline_symbols.space = ' ' " '\ua0'  
let g:airline_exclude_filename = []  
let g:Powerline_symbols='fancy'  
let Powerline_symbols='fancy'  
let g:bufferline_echo=0  
set t_Co=256  
set helplang=cn
" 更换主题  
function! Airline_Change_Theme()
	if g:airline_theme ==? 'light'
		AirlineTheme solarized
	elseif g:airline_theme ==? 'solarized'
		AirlineTheme dark
	elseif g:airline_theme ==? 'dark'
		AirlineTheme solarized_flood
	elseif g:airline_theme ==? 'solarized_flood'
		AirlineTheme angr
	elseif g:airline_theme ==? 'angr'
		AirlineTheme atomic
	elseif g:airline_theme ==? 'atomic'
		AirlineTheme biogoo
	elseif g:airline_theme ==? 'biogoo'
		AirlineTheme badcat
	elseif g:airline_theme ==? 'badcat'
		AirlineTheme badwolf
	elseif g:airline_theme ==? 'badwolf'
		AirlineTheme jellybeans
	elseif g:airline_theme ==? 'jellybeans'
		AirlineTheme light
	endif
endfunction
function Airline_Change_Theme_Timer(timer) 
	:call Airline_Change_Theme()
endfunction
nnoremap <silent> <Leader>ai :call Airline_Change_Theme()<CR>
" 自动更换主题
" exe 'autocmd CursorHold * : call Airline_Change_Theme()' 
" exe 'autocmd BufWritePost * : call Airline_Change_Theme()' 
" let timer = timer_start(3000 , 'Airline_Change_Theme_Timer' , {'repeat': -1})
" }}}
"Taglist {{{
" let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Left_Window=1 "在Vim窗口左侧显示taglist窗口
nmap <Leader>ta :Tlist<CR>
" }}}
"MarkdownPreview {{{
nnoremap <Leader>md :MarkdownPreview<CR>
nnoremap <Leader>MD :MarkdownPreviewStop<CR>
" }}}
" Vim-Markdown {{{
" 代码块高亮
let g:vim_markdown_fenced_languages = [
			\ 'c++=cpp' ,
			\ 'vim=vim' ,
			\ 'bash=sh' ,
			\ 'python=py' ,
			\ 'py=python' ,
			\ 'python3=py3' ,
			\ ]
" 高亮Latex
let g:vim_markdown_math = 1
" 高亮jekyll
let g:vim_markdown_frontmatter = 1
" 按ge跳转链接时自动保存  
let g:vim_markdown_autowrite = 1
" }}}
" ale {{{
"自定义error和warning图标
let g:ale_sign_error = '✗!'
let g:ale_sign_warning = '⚠ '
"在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" let g:ale_statusline_format = ['  %d', '⚡ %d', '✔ OK']
" ✓
let g:ale_enabled = 1
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查,etc.
let g:ale_linters = {
\   'c++': ['clang -pedantic'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'markdown' : ['mdl'],
\   'HTML' : ['tidy'],
\   'Bash' : ['shellcheck'],
\   'Vim' : ['vint'],
\ }
" 打开或关闭
nnoremap <Leader>ale :ALEEnable<CR>
nnoremap <Leader>ALE :ALEDisable<CR>
" }}}
" LeaderF {{{
" nmap <Leader>fi :LeaderfFile<CR>
nnoremap <Leader>fu :LeaderfFunctionAll<CR>
nnoremap <Leader>bt :LeaderfBufTagAll<CR>
nnoremap <Leader>bu :LeaderfBufferAll<CR>
nnoremap <Leader>co :LeaderfColorscheme<CR>
nnoremap <Leader>fm :LeaderfMru<CR>
nnoremap <Leader>li :LeaderfLineAll<CR>
let g:Lf_CommandMap = {'<F5>': ['<C-l>']}
let g:Lf_ShortcutF = '<Leader>fi'
let g:Lf_NumberOfHighlight = 200
let g:Lf_MruMaxFiles = 200 " 最大标记数量
let g:Lf_StlColorscheme = 'powerline' " 颜色主题
" let g:Lf_StlSeparator = { 'left': '►', 'right': '◄', 'font': '' } " 标记字符
" let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂' } " 标记字符
let g:Lf_StlSeparator = { 'left': '', 'right': ''} " 标记字符
let g:Lf_PreviewCode = 1 " 预览tag
let g:Lf_PreviewResult = {
			\ 'File': 1,
			\ 'Buffer': 1,
			\ 'Mru': 1,
			\ 'Tag': 1,
			\ 'BufTag': 1,
			\ 'Function': 1,
			\ 'Line': 1,
			\ 'Colorscheme': 1
			\}
let g:Lf_ExternalCommand = 'find "%s" -maxdepth 3 -type f 2> /dev/null'           " On MacOSX/Linux
" }}}
" minibufexpl插件的一般设置 {{{
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" }}}
" Ag {{{
command! -bang -nargs=* Ag
			\ call fzf#vim#ag(<q-args>,
			\ <bang>0 ? fzf#vim#with_preview('up:60%')
			\ : fzf#vim#with_preview('right:50%:hidden', '?'),
			\ <bang>0)
" }}}
" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
function! s:noregexp(pattern) abort
  return '\V' . escape(a:pattern, '\')
endfunction
function! s:config() abort
  return {'converters': [function('s:noregexp')]}
endfunction
noremap <silent><expr> z/ incsearch#go(<SID>config())
" }}}
" DrawIt {{{
let g:jsq_for_drawit = 3
function! D_another()
	let g:jsq_for_drawit += 1
	if g:jsq_for_drawit == 4
		let g:jsq_for_drawit = 1
	endif
	if g:jsq_for_drawit == 1
		DIdbl
	elseif g:jsq_for_drawit == 2
		DInrml
	elseif g:jsq_for_drawit == 3
		DIsngl
	endif
endfunction

function! D_open ()
	DIstart
	let g:jsq_for_drawit = 3
	nmap h <Left>
	nmap j <Down>
	nmap k <Up>
	nmap l <Right>
	nmap i <Home>
	nmap p <PageUp>
	nmap n <End>
	nmap o <PageDown>
	nnoremap <Leader>d :call D_another()<CR>
	nnoremap <Esc> :call D_close()<CR>
endfunction

function! D_close ()
	DIstop
	nunmap h
	nunmap j
	nunmap k
	nunmap l
	nunmap i
	nunmap p
	nunmap n
	nunmap o
	nunmap <Esc>
	nnoremap <Leader>d :call D_open()<CR>
endfunction

nnoremap <Leader>d :call D_open()<CR>
" }}}
" Gitgutter {{{
set updatetime=100
let g:gitgutter_sign_added = '+>'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = 'dd'
let g:gitgutter_sign_removed_first_line = 'd>'
let g:gitgutter_sign_modified_removed = '~d'
let g:gitgutter_max_signs = 1000
nnoremap <Leader>gi <Plug>GitGutterPreviewHunk
" nnoremap <Leader>com <Plug>GitGutterStageHunk
nnoremap <Leader>uu <Plug>GitGutterUndoHunk
" set signcolumn=yes
" let g:gitgutter_sign_column_always = 1
highlight SignColumn guibg=blue      " gVim/MacVim 
" }}}
" ?.... {{{
nmap \ gc
nmap \\ gcc
vmap \ gc
" }}}
" NERDTree {{{
nnoremap <Leader>tf :NERDTreeFind<CR>
nnoremap <Leader>te :NERDTree<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" exe 'autocmd VimEnter * : NERDTree'
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos='right'
" 窗口大小
let NERDTreeWinSize=25
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" }}}
" UndoTree {{{
nnoremap <Leader>un :UndotreeToggle<CR>
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif
" 窗口大小
let g:undotree_SplitWidth = 20
" 标示形状
let g:undotree_TreeNodeShape = '*'
" 高亮文本
let g:undotree_HighlightChangedText = 0
" 靠右
let g:undotree_WindowLayout = 4
let g:undotree_CustomDiffpanelCmd = 'botright 5 new'
" }}}
" deoplete {{{
" let g:deoplete#enable_at_startup = 1
" }}}
" NCM {{{
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
autocmd User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'css',
			\ 'priority': 9, 
			\ 'subscope_enable': 1,
			\ 'scope': ['css','scss'],
			\ 'mark': 'css',
			\ 'word_pattern': '[\w\-]+',
			\ 'complete_pattern': ':\s*',
			\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			\ })
" }}}
" Plan {{{
let g:p_edit_files = {
			\ 'plan': '/home/kewth/Desktop/plan.md',
			\ 'diary': '/home/kewth/Desktop/plan.md',
			\}
nnoremap <Leader>plan :tabnew /home/kewth/Desktop/plan.md<CR>:EditPlan<CR>
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
nnoremap <silent> <CR> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 打开/关闭所有折叠
nnoremap <silent> zo zR
nnoremap <silent> zc zM
" }}} 
" 各种map {{{
" 模仿MS Windows中的快捷键 {{{
" vnoremap <C-c> "+y
" nnoremap <C-c> "+y
" nnoremap <C-c><C-c> "+yy
" vnoremap <C-z> "+d
" nnoremap <C-z> "+d
" nnoremap <C-v> "+p
" vnoremap <C-v> "+p
" inoremap <C-v> <Left><C-o>"+p
" noremap <C-v> "+p
" nmap <C-a> ggvG$
" }}}

" 退出 {{{
nnoremap <Leader>w :up<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>rq : q!<CR>
" }}}

" 窗口操作 {{{
nnoremap <Leader>kk :split<CR>
nnoremap <Leader>jj :split<CR><C-w>j
nnoremap <Leader>hh :vsplit<CR>
nnoremap <Leader>ll :vsplit<CR><C-w>l
nnoremap <Leader>bo :botright copen 8 <CR>
" }}}

" Terminal {{{
nnoremap <Leader>ba :terminal<CR>:set nonu<CR>a
tnoremap <C-\> <C-\><C-n>
nnoremap <Leader>ca :ConqueTerm bash<CR>
" }}}

" 分页操作 {{{
nnoremap <Leader><Tab><Tab> :tabnew<CR>
nnoremap <Leader><Tab>] :tabmove +1<CR>
nnoremap <Leader><Tab>[ :tabmove -1<CR>
" }}}

" 插入模式(等)替换键 {{{
" 模仿terminal快捷键
inoremap <C-d> <Del>
" }}}

" 光标移动 {{{
" 屏幕行移动
noremap <C-n> gj 
noremap <C-p> gk
" }}}

" 窗口大小 {{{
set noignorecase
if has('gui_running')
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
endif
" }}}

" 目录设置 {{{
nnoremap <Leader>cd :cd %:p:h<CR>
" 自动进入当前目录
cd %:p:h
" }}}

" 命令行 {{{
nnoremap : q:a
" }}}

" }}}
" Gvim/neovim {{{
" if has('gui_running')
	" 移除菜单栏和工具栏
	" <span style="font-size:18px;">:set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar</span>
	set guioptions-=m
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
	" }}}
" endif
"  }}}
" funny print {{{
function To_buffer() " {{{
	let _line = line('.')
	if(_line == 9 || _line == 10 || _line == 11)
		set modifiable
		undo
	else
		echo 'Unknow place'
	endif
	if(_line == 10)
		LeaderfFileFullScreen
	elseif(_line == 11)
		NERDTree
	elseif(_line == 12)
		quit!
	endif
endfunction "}}}
function To_up() " {{{
	if(line('.') > 9)
		normal! k
	endif
endfunction " }}}
function To_down() " {{{
	if(line('.') >= 9)
		normal! j
	endif
endfunction " }}}
function Welcome() " {{{
	" vs /home/kewth/.config/nvim/welcome
	call append(0,'   /##   /##        /####    /#                     /##    /## ##             ')
	call append(1,'  | ## / ##        \ #_ ##  | #                    | ##   | # |_/             ')
	call append(2,'  \  #| ##         \ # \ ## \  #  /######  /###### | ##   | # /##/######/#### ')
	call append(3,'   \ ###/  /#######\ ## \ ## \ # /## __ # / #____ #|  ## / ##| #| ##_  ##_  ##')
	call append(4,'   \ #_ ##\_______/ \ #  \ ##| #| #######| #     \ #\  ## ## | #| ## \ ## \ ##')
	call append(5,'   \ # \ ##         \  #  \  # #| ##     | #     | # \  ###/ | #| ## | ## | ##')
	call append(6,'   \ ## \ ##         \ #   \  ##|  ######\_ #######   \  #/  | #| ## | ## | ##')
	call append(7,'   \__/ \__/         \_/    \__/ \______/ \_______/    \_/   |__|__/ |__/ |__/        ─────Kewth')
	call append(8,'> To clear this buffer')
	call append(9,'> To open LeaderF which is used to serach files')
	call append(10,'> To open NerdTree which is used to serach files on a tree')
	call append(11,'> To exit neovim(or press q)')
	call append(12,'Press enter(ctrl-m) at some lines to do something')
	set nomodifiable
	nnoremap <buffer> <CR> :call To_buffer()<CR>
	nnoremap <buffer> q :q!<CR>
	nnoremap <buffer> k :call To_up()<CR>
	nnoremap <buffer> j :call To_down()<CR>
endfunction " }}}
exe 'autocmd VimEnter * : call Welcome()'
    " ▄████████    ▄███████▄    ▄████████  ▄████████    ▄████████  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄             "
   " ███    ███   ███    ███   ███    ███ ███    ███   ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄           "
   " ███    █▀    ███    ███   ███    ███ ███    █▀    ███    █▀  ███    ███ ███▌ ███   ███   ███           "
   " ███          ███    ███   ███    ███ ███         ▄███▄▄▄     ███    ███ ███▌ ███   ███   ███           "
 " ▀███████████ ▀█████████▀  ▀███████████ ███        ▀▀███▀▀▀     ███    ███ ███▌ ███   ███   ███           " LAJI
          " ███   ███          ███    ███ ███    █▄    ███    █▄  ███    ███ ███  ███   ███   ███           "
    " ▄█    ███   ███          ███    ███ ███    ███   ███    ███ ███    ███ ███  ███   ███   ███           "
  " ▄████████▀   ▄████▀        ███    █▀  ████████▀    ██████████  ▀██████▀  █▀    ▀█   ███   █▀            "

" }}}
